<?php

$allowTestMenu = true;
header('Content-Type: text/plain; charset=x-user-defined');
error_reporting(0);
set_time_limit(0);
$_POST['host'] = DB_HOST;
$_POST['port'] = DB_PORT;
$_POST['login'] = DB_USER;
if (phpversion_int() < 50300) {
	set_magic_quotes_runtime(0);
}

if (phpversion_int() < 40005) {
	echoheader(201);
	echo getblock('unsupported php version');
	exit();
}

if (phpversion_int() < 40010) {
	global $HTTP_POST_VARS;
	$_POST = &$HTTP_POST_VARS;
}

if (!isset($_POST['actn']) || !isset($_POST['host']) || !isset($_POST['port']) || !isset($_POST['login'])) {
	$testMenu = $allowTestMenu;

	if (!$testMenu) {
		echoheader(202);
		echo getblock('invalid parameters');
		exit();
	}
}

if (!$testMenu) {
	if ($_POST['encodeBase64'] == '1') {
		$i = 0;

		for (; $i < count($_POST['q']); $i++) {
			$_POST['q'][$i] = base64_decode($_POST['q'][$i]);
		}
	}

	if (!function_exists('mysql_connect')) {
		echoheader(203);
		echo getblock('MySQL not supported on the server');
		exit();
	}

	$errno_c = 0;
	$hs = $_POST['host'];

	if ($_POST['port']) {
		$hs .= ':' . $_POST['port'];
	}

	$conn = mysql_connect($hs, $_POST['login'], $_POST['password']);
	$errno_c = mysql_errno();

	if (($errno_c <= 0) && ($_POST['db'] != '')) {
		$res = mysql_select_db($_POST['db'], $conn);
		$errno_c = mysql_errno();
	}

	echoheader($errno_c);

	if (0 < $errno_c) {
		echo getblock(mysql_error());
	}
	else if ($_POST['actn'] == 'C') {
		echoconninfo($conn);
	}
	else if ($_POST['actn'] == 'Q') {
		$i = 0;

		for (; $i < count($_POST['q']); $i++) {
			$query = $_POST['q'][$i];

			if ($query == '') {
				continue;
				goto label209;
			}

			label209:

			if (phpversion_int() < 50400) {
				if (get_magic_quotes_gpc()) {
					$query = stripslashes($query);
				}
			}

			$res = mysql_query($query, $conn);
			$errno = mysql_errno();
			$affectedrows = mysql_affected_rows($conn);
			$insertid = mysql_insert_id($conn);
			$numfields = mysql_num_fields($res);
			$numrows = mysql_num_rows($res);
			echoresultsetheader($errno, $affectedrows, $insertid, $numfields, $numrows);

			if (0 < $errno) {
				echo getblock(mysql_error());
			}
			else if (0 < $numfields) {
				echofieldsheader($res, $numfields);
				echodata($res, $numfields, $numrows);
			}
			else if (40300 <= phpversion_int()) {
				echo getblock(mysql_info($conn));
			}
			else {
				echo getblock('');
			}

			if ($i < (count($_POST['q']) - 1)) {
				echo "\x1";
			}
			else {
				echo "\0";
			}

			mysql_free_result($res);
		}
	}

	exit();
}

header('Content-Type: text/html');
echo '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">' . "\r\n" . '<html>' . "\r\n" . '<head>' . "\r\n\t" . '<title>Navicat HTTP Tunnel Tester</title>' . "\r\n\t" . '<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">' . "\r\n\t" . '<style type="text/css">' . "\r\n\t\t" . 'body{' . "\r\n\t\t\t" . 'margin: 30px;' . "\r\n\t\t\t" . 'font-family: Tahoma;' . "\r\n\t\t\t" . 'font-weight: normal;' . "\r\n\t\t\t" . 'font-size: 14px;' . "\r\n\t\t\t" . 'color: #222222;' . "\r\n\t\t" . '}' . "\r\n\t\t" . 'table{' . "\r\n\t\t\t" . 'width: 100%;' . "\r\n\t\t\t" . 'border: 0px;' . "\r\n\t\t" . '}' . "\r\n\t\t" . 'input{' . "\r\n\t\t\t" . 'font-family:Tahoma,sans-serif;' . "\r\n\t\t\t" . 'border-style:solid;' . "\r\n\t\t\t" . 'border-color:#666666;' . "\r\n\t\t\t" . 'border-width:1px;' . "\r\n\t\t" . '}' . "\r\n\t\t" . 'fieldset{' . "\r\n\t\t\t" . 'border-style:solid;' . "\r\n\t\t\t" . 'border-color:#666666;' . "\r\n\t\t\t" . 'border-width:1px;' . "\r\n\t\t" . '}' . "\r\n\t\t" . '.Title1{' . "\r\n\t\t\t" . 'font-size: 30px;' . "\r\n\t\t\t" . 'color: #003366;' . "\r\n\t\t" . '}' . "\r\n\t\t" . '.Title2{' . "\r\n\t\t\t" . 'font-size: 10px;' . "\r\n\t\t\t" . 'color: #999966;' . "\r\n\t\t" . '}' . "\r\n\t\t" . '.TestDesc{' . "\r\n\t\t\t" . 'width:70%' . "\r\n\t\t" . '}' . "\r\n\t\t" . '.TestSucc{' . "\r\n\t\t\t" . 'color: #00BB00;' . "\r\n\t\t" . '}' . "\r\n\t\t" . '.TestFail{' . "\r\n\t\t\t" . 'color: #DD0000;' . "\r\n\t\t" . '}' . "\r\n\t\t" . '.mysql{' . "\r\n\t\t" . '}' . "\r\n\t\t" . '.pgsql{' . "\r\n\t\t\t" . 'display:none;' . "\r\n\t\t" . '}' . "\r\n\t\t" . '.sqlite{' . "\r\n\t\t\t" . 'display:none;' . "\r\n\t\t" . '}' . "\r\n\t\t" . '#page{' . "\r\n\t\t\t" . 'max-width: 42em;' . "\r\n\t\t\t" . 'min-width: 36em;' . "\r\n\t\t\t" . 'border-width: 0px;' . "\r\n\t\t\t" . 'margin: auto auto;' . "\r\n\t\t" . '}' . "\r\n\t\t" . '#host, #dbfile{' . "\r\n\t\t\t" . 'width: 300px;' . "\r\n\t\t" . '}' . "\r\n\t\t" . '#port{' . "\r\n\t\t\t" . 'width: 75px;' . "\r\n\t\t" . '}' . "\r\n\t\t" . '#login, #password, #db{' . "\r\n\t\t\t" . 'width: 150px;' . "\r\n\t\t" . '}' . "\r\n\t\t" . '#Copyright{' . "\r\n\t\t\t" . 'text-align: right;' . "\r\n\t\t\t" . 'font-size: 10px;' . "\r\n\t\t\t" . 'color: #888888;' . "\r\n\t\t" . '}' . "\r\n\t" . '</style>' . "\r\n\t" . '<script type="text/javascript">' . "\r\n\t" . 'function getInternetExplorerVersion(){' . "\r\n\t\t" . 'var ver = -1;' . "\r\n\t\t" . 'if (navigator.appName == "Microsoft Internet Explorer"){' . "\r\n\t\t\t" . 'var regex = new RegExp("MSIE ([0-9]{1,}[\\.0-9]{0,})");' . "\r\n\t\t\t" . 'if (regex.exec(navigator.userAgent))' . "\r\n\t\t\t\t" . 'ver = parseFloat(RegExp.$1);' . "\r\n\t\t" . '}' . "\r\n\t\t" . 'return ver;' . "\r\n\t" . '}' . "\r\n\t" . 'function setText(element, text, succ){' . "\r\n\t\t" . 'element.className = (succ)?"TestSucc":"TestFail";' . "\r\n\t\t" . 'element.innerHTML = text;' . "\r\n\t" . '}' . "\r\n\t" . 'function getByteAt(str, offset){' . "\r\n\t\t" . 'return str.charCodeAt(offset) & 0xff;' . "\r\n\t" . '}' . "\r\n\t" . 'function getIntAt(binStr, offset){' . "\r\n\t\t" . 'return (getByteAt(binStr, offset) << 24)+' . "\r\n\t\t\t" . '(getByteAt(binStr, offset+1) << 16)+' . "\r\n\t\t\t" . '(getByteAt(binStr, offset+2) << 8)+' . "\r\n\t\t\t" . '(getByteAt(binStr, offset+3) >>> 0);' . "\r\n\t" . '}' . "\r\n\t" . 'function getBlockStr(binStr, offset){' . "\r\n\t\t" . 'if (getByteAt(binStr, offset) < 254)' . "\r\n\t\t\t" . 'return binStr.substring(offset+1, offset+1+binStr.charCodeAt(offset));' . "\r\n\t\t" . 'else' . "\r\n\t\t\t" . 'return binStr.substring(offset+5, offset+5+getIntAt(binStr, offset+1));' . "\r\n\t" . '}' . "\r\n\t" . 'function doServerTest(){' . "\r\n\t\t" . 'var version = getInternetExplorerVersion();' . "\r\n\t\t" . 'if (version==-1 || version>=9.0){' . "\r\n\t\t\t" . 'var xmlhttp = (window.XMLHttpRequest)? new XMLHttpRequest() : xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");' . "\r\n\r\n\t\t\t" . 'xmlhttp.onreadystatechange=function(){' . "\r\n\t\t\t\t" . 'var outputDiv = document.getElementById("ServerTest");' . "\r\n\t\t\t\t" . 'if (xmlhttp.readyState == 4){' . "\r\n\t\t\t\t\t" . 'if (xmlhttp.status == 200){' . "\r\n\t\t\t\t\t\t" . 'var errno = getIntAt(xmlhttp.responseText, 6);' . "\r\n\t\t\t\t\t\t" . 'if (errno == 0)' . "\r\n\t\t\t\t\t\t\t" . 'setText(outputDiv, "Connection Success!", true);' . "\r\n\t\t\t\t\t\t" . 'else' . "\r\n\t\t\t\t\t\t\t" . 'setText(outputDiv, parseInt(errno)+" - "+getBlockStr(xmlhttp.responseText, 16), false);' . "\r\n\t\t\t\t\t" . '}else' . "\r\n\t\t\t\t\t\t" . 'setText(outputDiv, "HTTP Error - "+xmlhttp.status, false);' . "\r\n\t\t\t\t" . '}' . "\r\n\t\t\t" . '}' . "\r\n\r\n\t\t\t" . 'var params = "";' . "\r\n\t\t\t" . 'var form = document.getElementById("TestServerForm");' . "\r\n\t\t\t" . 'for (var i=0; i<form.elements.length; i++){' . "\r\n\t\t\t\t" . 'if (i>0) params += "&";' . "\r\n\t\t\t\t" . 'params += form.elements[i].id+"="+form.elements[i].value.replace("&", "%26");' . "\r\n\t\t\t" . '}' . "\r\n\r\n\t\t\t" . 'document.getElementById("ServerTest").className = "";' . "\r\n\t\t\t" . 'document.getElementById("ServerTest").innerHTML = "Connecting...";' . "\r\n\t\t\t" . 'xmlhttp.open("POST", "", true);' . "\r\n\t\t\t" . 'xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");' . "\r\n\t\t\t" . 'xmlhttp.setRequestHeader("Content-length", params.length);' . "\r\n\t\t\t" . 'xmlhttp.setRequestHeader("Connection", "close");' . "\r\n\t\t\t" . 'xmlhttp.send(params);' . "\r\n\t\t" . '}else{' . "\r\n\t\t\t" . 'document.getElementById("ServerTest").className = "";' . "\r\n\t\t\t" . 'document.getElementById("ServerTest").innerHTML = "Internet Explorer "+version+" is not supported, please use Internet explorer 9.0 or above, firefox, chrome or safari";' . "\r\n\t\t" . '}' . "\r\n\t" . '}' . "\r\n\t" . '</script>' . "\r\n" . '</head>' . "\r\n\r\n" . '<body>' . "\r\n" . '<div id="page">' . "\r\n" . '<p>' . "\r\n\t" . '<font class="Title1">Navicat&trade;</font><br>' . "\r\n\t" . '<font class="Title2">The gateway to your database!</font>' . "\r\n" . '</p>' . "\r\n" . '<fieldset>' . "\r\n\t" . '<legend>System Environment Test</legend>' . "\r\n\t" . '<table>' . "\r\n\t\t" . '<tr style="';
echo 'display:none';
echo '"><td width=70%>PHP installed properly</td><td class="TestFail">No</td></tr>' . "\r\n\t\t";
echo dosystemtest();
echo "\t" . '</table>' . "\r\n" . '</fieldset>' . "\r\n" . '<br>' . "\r\n" . '<fieldset>' . "\r\n\t" . '<legend>Server Test</legend>' . "\r\n\t" . '<form id="TestServerForm" action="#" onSubmit="return false;">' . "\r\n\t" . '<input type=hidden id="actn" value="C">' . "\r\n\t" . '<table>' . "\r\n\t\t" . '<tr class="mysql"><td width="35%">Hostname/IP Address:</td><td><input type=text id="host" placeholder="localhost"></td></tr>' . "\r\n\t\t" . '<tr class="mysql"><td>Port:</td><td><input type=text id="port" placeholder="3306"></td></tr>' . "\r\n\t\t" . '<tr class="pgsql"><td>Initial Database:</td><td><input type=text id="db" placeholder="template1"></td></tr>' . "\r\n\t\t" . '<tr class="mysql"><td>Username:</td><td><input type=text id="login" placeholder="root"></td></tr>' . "\r\n\t\t" . '<tr class="mysql"><td>Password:</td><td><input type=password id="password" placeholder=""></td></tr>' . "\r\n\t\t" . '<tr class="sqlite"><td>Database File:</td><td><input type=text id="dbfile" placeholder="sqlite.db"></td></tr>' . "\r\n\t\t" . '<tr><td></td><td><br><input id="TestButton" type="submit" value="Test Connection" onClick="doServerTest()"></td></tr>' . "\r\n\t" . '</table>' . "\r\n\t" . '</form>' . "\r\n\t" . '<div id="ServerTest"><br></div>' . "\r\n" . '</fieldset>' . "\r\n" . '<p id="Copyright">Copyright &copy; PremiumSoft &trade; CyberTech Ltd. All Rights Reserved.</p>' . "\r\n" . '</div>' . "\r\n" . '</body>' . "\r\n" . '</html>';
function phpversion_int()
{
	list($maVer, $miVer, $edVer) = preg_split('[/.-]', phpversion());
	return ($maVer * 10000) + ($miVer * 100) + $edVer;
}

function GetLongBinary($num)
{
	return pack('N', $num);
}

function GetShortBinary($num)
{
	return pack('n', $num);
}

function GetDummy($count)
{
	$str = '';
	$i = 0;

	for (; $i < $count; $i++) {
		$str .= "\0";
	}

	return $str;
}

function GetBlock($val)
{
	$len = strlen($val);

	if ($len < 254) {
		return chr($len) . $val;
	}
	else {
		return "\xfe" . getlongbinary($len) . $val;
	}
}

function EchoHeader($errno)
{
	$str = getlongbinary(1111);
	$str .= getshortbinary(202);
	$str .= getlongbinary($errno);
	$str .= getdummy(6);
	echo $str;
}

function EchoConnInfo($conn)
{
	$str = getblock(mysql_get_host_info($conn));
	$str .= getblock(mysql_get_proto_info($conn));
	$str .= getblock(mysql_get_server_info($conn));
	echo $str;
}

function EchoResultSetHeader($errno, $affectrows, $insertid, $numfields, $numrows)
{
	$str = getlongbinary($errno);
	$str .= getlongbinary($affectrows);
	$str .= getlongbinary($insertid);
	$str .= getlongbinary($numfields);
	$str .= getlongbinary($numrows);
	$str .= getdummy(12);
	echo $str;
}

function EchoFieldsHeader($res, $numfields)
{
	$str = '';
	$i = 0;

	for (; $i < $numfields; $i++) {
		$str .= getblock(mysql_field_name($res, $i));
		$str .= getblock(mysql_field_table($res, $i));
		$type = mysql_field_type($res, $i);
		$length = mysql_field_len($res, $i);

		switch ($type) {
		case 'int':
			if (11 < $length) {
				$type = 8;
			}
			else if (9 < $length) {
				$type = 3;
			}
			else if (6 < $length) {
				$type = 9;
			}
			else if (4 < $length) {
				$type = 2;
			}
			else {
				$type = 1;
			}

			break;

		case 'real':
			if ($length == 12) {
				$type = 4;
			}
			else if ($length == 22) {
				$type = 5;
			}
			else {
				$type = 0;
			}

			break;

		case 'null':
			$type = 6;
			break;

		case 'timestamp':
			$type = 7;
			break;

		case 'date':
			$type = 10;
			break;

		case 'time':
			$type = 11;
			break;

		case 'datetime':
			$type = 12;
			break;

		case 'year':
			$type = 13;
			break;

		case 'blob':
			if (16777215 < $length) {
				$type = 251;
			}
			else if (65535 < $length) {
				$type = 250;
			}
			else if (255 < $length) {
				$type = 252;
			}
			else {
				$type = 249;
			}

			break;

		default:
			$type = 253;
		}

		$str .= getlongbinary($type);
		$flags = explode(' ', mysql_field_flags($res, $i));
		$intflag = 0;

		if (in_array('not_null', $flags)) {
			$intflag += 1;
		}

		if (in_array('primary_key', $flags)) {
			$intflag += 2;
		}

		if (in_array('unique_key', $flags)) {
			$intflag += 4;
		}

		if (in_array('multiple_key', $flags)) {
			$intflag += 8;
		}

		if (in_array('blob', $flags)) {
			$intflag += 16;
		}

		if (in_array('unsigned', $flags)) {
			$intflag += 32;
		}

		if (in_array('zerofill', $flags)) {
			$intflag += 64;
		}

		if (in_array('binary', $flags)) {
			$intflag += 128;
		}

		if (in_array('enum', $flags)) {
			$intflag += 256;
		}

		if (in_array('auto_increment', $flags)) {
			$intflag += 512;
		}

		if (in_array('timestamp', $flags)) {
			$intflag += 1024;
		}

		if (in_array('set', $flags)) {
			$intflag += 2048;
		}

		$str .= getlongbinary($intflag);
		$str .= getlongbinary($length);
	}

	echo $str;
}

function EchoData($res, $numfields, $numrows)
{
	$i = 0;

	for (; $i < $numrows; $i++) {
		$str = '';
		$row = mysql_fetch_row($res);
		$j = 0;

		for (; $j < $numfields; $j++) {
			if (is_null($row[$j])) {
				$str .= "\xff";
			}
			else {
				$str .= getblock($row[$j]);
			}
		}

		echo $str;
	}
}

function doSystemTest()
{
	function output($description, $succ, $resStr)
	{
		echo '<tr><td class="TestDesc">' . $description . '</td><td ';
		echo $succ ? 'class="TestSucc">' . $resStr[0] . '</td></tr>' : 'class="TestFail">' . $resStr[1] . '</td></tr>';
	}

	output('PHP version >= 4.0.5', 40005 <= phpversion_int(), array('Yes', 'No'));
	output('mysql_connect() available', function_exists('mysql_connect'), array('Yes', 'No'));

	if ((40302 <= phpversion_int()) && (substr($_SERVER['SERVER_SOFTWARE'], 0, 6) == 'Apache') && function_exists('apache_get_modules')) {
		if (in_array('mod_security2', apache_get_modules())) {
			output('Mod Security 2 installed', false, array('No', 'Yes'));
		}
	}
}

?>