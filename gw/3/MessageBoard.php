<?php
	/*******************************************
	
	*	接
	*	收
	*	传
	*	值
	
	*******************************************/
	
	$type = $_GET["type"];
	$name = $_GET["name"];
	$email = $_GET["email"];
	$subject = $_GET["subject"];
	$message = $_GET["message"];
	
	/******************************************
	
	*	编
	*	写
	*	数
	*	据
	
	******************************************/
	$data = array();																	//	准备数据数组
	$data['name'] = $name;
	$data['email'] = $email;
	$data['subject'] = $subject;
	$data['message'] = $message;
	$data['addtime'] = time();															//	数据写入时间
	
	$jsonStr = json_encode($data);
	
	/*****************************************
	
	*	保
	*	存
	*	数
	*	据
	
	*****************************************/
	
	$dir = './';																		//	目录
	$fileName = 'saveMessageBoardData.php';												//	保存文件名
	$filePath = trim($dir,'/').'/'.$fileName;											//	文件路径
	if(is_file($filePath)){
		fclose(fopen($filePath,'w'));
	}
	
	$fileData = json_decode(file_get_contents($filePath),true);							//	获取文件数据
	if($fileData == null){																//	初始为空则添加数据
		$fileData = array($data);
	}else{																				//	已存在数据则追加新数据
		array_push($fileData,$data);											
	}
	$jsonStr = json_encode($fileData);
	
	$fileR = fopen($filePath,'w');														//	打开文件
	fwrite($fileR,$jsonStr);															//	写入文件
	fclose($fileR);																		//	关闭文件
	
	echo '<div style="margin:auto;margin-top:10%;width:28%;height:30%;position:relative;">
		<img src="./assets/images/email.png" style="width:100%;"/>
		<p style="left:19.5%;width:66%;position:absolute;top:16%;color:#666;line-height:30px;"><font style="color:#333;margin-right:8px;font-weight:800;">&nbsp;'.$name.'</font>'.($type == 1 ? '先生/女士,您的留言我们已经收到，期待你更多的建议。' : 'Sir / madam, we have received your message and look forward to your more advice.' ).'</p>
		<!-- <div style="margin:40px auto;">
			<ul id="loca">
				<li></li>
				<li></li>
				<li></li>
			</ul>
		</div> -->
	</div>
	<script>document.body.style.backgroundColor = "#bfbfbe";
		var loca = document.getElementById("loca");
		var i = 0;
		setInterval(function(){
			
		},100);
		setTimeout(function(){
			window.history.back(-1); 
		},2000);
		</script>';