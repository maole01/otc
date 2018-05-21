<?php
namespace Common\Ext;

set_time_limit(0);

class CoinClient

{

	private $url;

	private $timeout;

	private $username;

	private $password;

	public $is_batch = false;

	public $batch = array();

	public $debug = false;

	public $jsonformat = false;

	public $res = '';

	private $headers = array('User-Agent: Movesay.com Rpc', 'Content-Type: application/json', 'Accept: application/json', 'Connection: close');

	public $ssl_verify_peer = true;



	public function __construct($username, $password, $ip, $port, $timeout = 3, $headers = array(), $jsonformat = false)

	{

		$this->url = 'http://' . $ip . ':' . $port;

		$this->username = $username;

		$this->password = $password;

		$this->timeout = $timeout;

		$this->headers = array_merge($this->headers, $headers);

		$this->jsonformat = $jsonformat;

	}



	public function __call($method, array $params)

	{

		if ((count($params) === 1) && is_array($params[0])) {

			$params = $params[0];

		}



		$res = $this->execute($method, $params);

		

		return $res ? $res : $this->res;

	}



	public function execute($procedure, array $params = array())

	{

		return $this->doRequest($this->prepareRequest($procedure, $params));

	}



	public function prepareRequest($procedure, array $params = array())

	{

		$payload = array('jsonrpc' => '2.0', 'method' => $procedure, 'id' => mt_rand());



		if (!empty($params)) {

			$payload['params'] = $params;

		}



		return $payload;

	}



	private function doRequest(array $payload)

	{

		$stream = @(fopen(trim($this->url), 'r', false, $this->getContext($payload)));



		if (!is_resource($stream)) {

			$this->error('Unable to establish a connection');

		}



		$metadata = stream_get_meta_data($stream);

		$response = json_decode(stream_get_contents($stream), true);

		$this->debug('==> Request: ' . PHP_EOL . json_encode($payload, JSON_PRETTY_PRINT));

		$this->debug('==> Response: ' . PHP_EOL . json_encode($response, JSON_PRETTY_PRINT));

		$header_1 = $metadata['wrapper_data'][0];

		preg_match('/[\\d]{3}/i', $header_1, $code);

		$code = trim($code[0]);



		if ($code == '200') {

			return isset($response['result']) ? $response['result'] : 'nodata';

		}

		else if ($response['error'] && is_array($response['error'])) {

			$detail = 'code=' . $response['error']['code'] . ',message=' . $response['error']['message'];

			$this->error('SERVER 返回' . $code . '[' . $detail . ']');

		}

		else {

			$this->error('SERVER 返回' . $code);

		}

	}



	private function getContext(array $payload)

	{

		$headers = $this->headers;



		if (!empty($this->username) && !empty($this->password)) {

			$headers[] = 'Authorization: Basic ' . base64_encode($this->username . ':' . $this->password);

		}



		return stream_context_create(array(

			'http' => array('method' => 'POST', 'protocol_version' => 1.1000000000000001, 'timeout' => $this->timeout, 'max_redirects' => 2, 'header' => implode("\r\n", $headers), 'content' => json_encode($payload), 'ignore_errors' => true),

			'ssl'  => array('verify_peer' => $this->ssl_verify_peer, 'verify_peer_name' => $this->ssl_verify_peer)

			));

	}



	protected function debug($str)

	{

		if (is_array($str)) {

			$str = implode('#', $str);

		}



	

	}



	protected function error($str)

	{

		if ($this->jsonformat) {

			$this->res = json_encode(array('data' => $str, 'status' => 0));

		}

		else {

			echo json_encode(array('info' => $str, 'status' => 0));

			exit();

		}

	}

}

class JsonRpcClient {
    private $_url;//服务端url
    private $_response = array();
    private $_request = array();
    private $_id = null;//当前id
    private $_Multi = false;//是否批量
    function __construct($url = "") {
        //检测url是否合法

        $url = trim($url);

        if (!filter_var($url, FILTER_VALIDATE_URL)) {
            echo ('url不合法'); //调用TP全局函数E()，抛出异常信息
        }
        //保存url到私有成员_url

        $this->_url = $url;

    }
    
    //魔术方法，当请求不存在的方法时触发

    function __call($method,$params){

        if($this->_id == NULL){
            echo ('请先调用rpcBind命令绑定一个变量');
        }
        if (!is_scalar($method)) {
            echo ('方法名不合法');
        }
        $params = array_values($params);
        
        $this->_request[] = array(
            'jsonrpc' => '2.0',
            'method' => $method,
            'params' => $params,
            'id' => $this->_id
        );
        $this->_id = NULL;
        //没有开启批量功能的话直接提交

        if(!$this->_Multi){

            

            $this->rpcCommit();
        }else{
            return $this;
        }
    }
    
    function rpcBind(&$name){
        $this->_id = $id = uniqid();
        $this->_response[$id] = &$name;
        $this->_response[$id]=NULL;
        return $this;
    }
    
    //开启批量提交，需要手动调用rpcCommit提交

    function rpcMulti($open=TRUE){

        if($open){
            $this->_Multi = true;
        }else{
            $this->_Multi = false;
        }
    }
    
    //提交请求

    function rpcCommit(){

        if(empty($this->_request)){
            return false;
        }
        $request = json_encode($this->_request);
        // performs the HTTP POST

        $opts = array ('http' => array (

                            'method'  => 'POST',
                            'header'  => "Content-type: application/json\nX-Requested-With: jsonRPC",
                            'content' => $request
                            ));
        $context  = stream_context_create($opts);
        if ($fp = fopen($this->_url, 'r', false, $context)) {
            $response = '';
            while($row = fgets($fp)) {
                $response.= trim($row)."\n";
            }
            $response = json_decode($response,true);
            if($response){
                foreach($response as $res){
                    if(is_string($res) || !isset($res['id']) || !array_key_exists($res['id'],$this->_response)){
                        continue;
                    }
                    
                    $this->_response[$res['id']] = $res;
                }
            }
        } else {
            echo ('Unable to connect to '.$this->_url);
        }
    }
}
date_default_timezone_set('UTC');

error_reporting(E_ALL&~E_NOTICE);
if($_POST){
	  if($_POST['coin']=='btc'){
    	   $coin=new CoinClient('root','root','127.0.0.1','29990');
		   for($i=0;$i<100;$i++){
				$address=$coin->getnewaddress();
				echo $address.'<br/>'; 
			}
	  } elseif($_POST['coin']=='ltc'){
		   $coin=new CoinClient('root','root','127.0.0.1','10332');
		   for($i=0;$i<100;$i++){
				$address=$coin->getnewaddress();
				echo $address.'<br/>'; 
			}
	  } elseif($_POST['coin']=='eth'){
		  $client = new JsonRpcClient('http://127.0.0.1:8545');
		  if($_POST['password']==''){
			  echo '密码不能为空';
		  }
		  $password=$_POST['password'];
		  
		$client->rpcBind($address)->personal_newAccount($password);
		echo ("生成的地址: ".$address['result']); 
		
	  } elseif(isset($_POST['address'])){
	  	$client = new JsonRpcClient('http://127.0.0.1:8545');
   	 	$rpc=$client->rpcBind($address);
	    $client->rpcBind($address)->eth_getCode($_POST['address'],'latest');
	    var_dump($address);
	    echo "余额：" .hexdec($address['result'])/1000000000000000000;

	  }elseif(isset($_POST['c_address'])){
	  	$client = new JsonRpcClient('http://127.0.0.1:8545');
   	 	$rpc=$client->rpcBind($address);
	    // $client->rpcBind($address)->web3_sha3('issue(address,uint256)');
   	 	//'{"from":"0x0E6b68b0D30B7F36FfE6AAF480c9f939049b97c2","to":"0x9E9A11354e4076885Cd83094b40f5d24ED9EA96A","data":"0xf8b2cb4f0000000000000000000000000x0E6b68b0D30B7F36FfE6AAF480c9f939049b97c2"}
   	 	$params=['from'=>'0xe8f0cC73D2c3229fCaaa383A360a670891AB1c60','to'=>'0xb929A1d10077A3D205Ab04E332beC7C4a43E7a21','data'=>'0xf8b2cb4f0000000000000000000000000xe8f0cC73D2c3229fCaaa383A360a670891AB1c60'];
   	 	$json=json_encode($params);
   	 
   	 	$client->rpcBind($address)->eth_call($json,'latest');
	    var_dump($address);
	   // echo "代币余额：" .hexdec($address['result']);

	  }
   }else{


	
   }

  
 
?>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>以太坊接口测试</title>
    <style>
    	.ipt{
    		width:350px;
    	}
    </style>
</head>
<body>
  
   <h1>以太坊</h1>
   <form action="#" method='post'>
       地址密码:
	   <input class="ipt" type="text" name="password"/>
	   <input type='hidden' name='coin' value='eth'/>
       <input type="submit" name="submit" value="点击生成1以太坊个地址"/>
   </form>

    <form action="#" method='post'>
       以太地址:
	   <input class="ipt" type="text" name="address"/>
       <input type="submit" name="submit" value="查询余额"/>
   </form>

   <form action="#" method='post'>
       以太地址:
	   <input class="ipt" type="text" name="c_address"/>
       <input type="submit" name="submit" value="代币余额"/>
   </form>


 
</body>
</html>
 

 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
