var http = getHTTPObject();

function handleHttpResponse() {
	if(http.readyState == 4) {
		if(http.status == 200) {
			if(http.responseText != "") {
				document.getElementById('username').innerHTML = "";
				document.getElementById('username').innerHTML = http.responseText;
			} else {
				document.getElementById('username').innerHTML = "";
				document.getElementById('username').innerHTML = msg_can_rg;
			}
		} else {
			alert("你所请求的页面发生异常,可能会影响你浏览该页的信息! ");
			alert(http.status);
		}
	}
}

/**
 * 创建XMLHttpRequest对象的方法。
 */
function getHTTPObject() {
	var xmlhttp = null;
    if (window.ActiveXObject) {
      var versions = ['Microsoft.XMLHTTP', 'MSXML6.XMLHTTP', 'MSXML5.XMLHTTP', 'MSXML4.XMLHTTP', 'MSXML3.XMLHTTP', 'MSXML2.XMLHTTP', 'MSXML.XMLHTTP'];

      for (var i = 0; i < versions.length; i ++ ) {
        try {
          xmlhttp = new ActiveXObject(versions[i]);
          break;
        } catch (ex) {
          continue;
        }
      }
    } else {
      xmlhttp = new XMLHttpRequest();
    }
    return xmlhttp;
}

/**
 * 检测用户名.
 */
function is_registered( suser ) {
	var reguname = /^[a-zA-Z]+$/;
	var url = "/E-site/servlet/RegServlet";
	var username = trim(suser);
	url += "?suser=" + username + "&oprate=chkUser";
	if ( username == '' ) {
        document.getElementById('username').innerHTML = msg_username_empty;
    } else if ( username.length < 3 ) {
		document.getElementById('username').innerHTML = msg_username_shorter;
	} else if ( !reguname.test(username) ) {
		document.getElementById('username').innerHTML = msg_username_invalid;
	} else {
		http.open("GET",url,true);
		http.onreadystatechange = handleHttpResponse;
		http.send(null);
		return;
	}
}

/**
 * 检测用户名.
 */
function is_AdminRegistered( suser ) {
	var reguname = /^[a-zA-Z]+$/;
	var url = "/E-site/servlet/AdminRegServlet";
	var username = trim(suser);
	url += "?suser=" + username + "&oprate=chkUser";
	if ( username == '' ) {
        document.getElementById('username').innerHTML = msg_username_empty;
    } else if ( username.length < 3 ) {
		document.getElementById('username').innerHTML = msg_username_shorter;
	} else if ( !reguname.test(username) ) {
		document.getElementById('username').innerHTML = msg_username_invalid;
	} else {
		http.open("GET",url,true);
		http.onreadystatechange = handleHttpResponse;
		http.send(null);
		return;
	}
}

/**
 * 检测用户名.
 */
function is_SellerRegistered( suser ) {
	var reguname = /^[a-zA-Z]+$/;
	var url = "/E-site/servlet/SellerRegServlet";
	var username = trim(suser);
	url += "?suser=" + username + "&oprate=chkUser";
	if ( username == '' ) {
        document.getElementById('username').innerHTML = msg_username_empty;
    } else if ( username.length < 3 ) {
		document.getElementById('username').innerHTML = msg_username_shorter;
	} else if ( !reguname.test(username) ) {
		document.getElementById('username').innerHTML = msg_username_invalid;
	} else {
		http.open("GET",url,true);
		http.onreadystatechange = handleHttpResponse;
		http.send(null);
		return;
	}
}

/**
 * 检测密码.
 */
function check_password( password ) {
	if ( trim(password).length == 0 ) {
		document.getElementById('password').innerHTML = msg_password_empty;
	} else if ( password.length < 3 ) {
        document.getElementById('password').innerHTML = msg_password_shorter;
    } else {
        document.getElementById('password').innerHTML = msg_can_rg;
    }
}

/**
 * 检测确认密码.
 */
function check_conform_password( conform_password ) {
 	var old_password  = document.getElementById('spwd').value;
    if ( trim(conform_password).length == 0 ) {
		document.getElementById('password2').innerHTML = msg_password_empty;
	} else if ( conform_password.length < 3 ) {
        document.getElementById('password2').innerHTML = msg_password_shorter;
    } else if ( conform_password != old_password ) {
        document.getElementById('password2').innerHTML = msg_confirm_password_invalid;
    } else {
        document.getElementById('password2').innerHTML = msg_can_rg;
    }
}

/**
 * 检查E-MAIL地址.
 */
function checkEmail(email) {
	var regemail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)/;
	if (email == '') {
		document.getElementById('emailcheck').innerHTML = msg_email_empty;
	} else if ( !regemail.test(email) ) {
		document.getElementById('emailcheck').innerHTML = msg_email_format;
	} else {
		document.getElementById('emailcheck').innerHTML = msg_can_rg;
	}
}

/**
 * 检查电话号码格式
 */
function checkPhone(phone) {
	var regphone = /^[\d|\-|\s]+$/;
	if(phone == ''){
		document.getElementById('phonecheck').innerHTML = msg_phone_empty;
	} else if ( !regphone.test(phone) ) {
    	document.getElementById('phonecheck').innerHTML = msg_phone_format;
  	} else {
		document.getElementById('phonecheck').innerHTML = msg_can_rg;
  	}
}



/**
 * 用户登陆时验证
 */
function checkLoginForm() {
	var frm  = document.forms['loginUser'];
	var username  = trim(frm.elements['suser'].value);
	var password = frm.elements['spwd'].value;
	var rand = frm.elements['rand'].value;
	if ( username.length == 0 ) {
		alert(username_empty);
		frm.elements['suser'].focus();
		return false;
	} else if ( password.length == 0 ) {
		alert(password_empty);
		frm.elements['spwd'].focus();
		return false;
	} else if ( rand.length < 4 ) {
		alert(rand_msg);
		frm.elements['rand'].focus();
		return false;
	}
}

/**
 * 修改密码时验证
 */
function checkResetPwdForm() {
	var frm  = document.forms['resetPwdUser'];
	var old_password = frm.elements['old_password'].value;
	var new_password = frm.elements['new_password'].value;
	var comfirm_password = frm.elements['comfirm_password'].value;
	if( old_password.length == 0 ) {
		alert(old_password_empty);
		frm.elements['old_password'].focus();
		return false;		
	} else if( old_password.length < 3 ) {
		alert(old_password_shorter);
		frm.elements['old_password'].focus();
		return false;
	} else if( new_password.length == 0 ) {
		alert(new_password_empty);
		frm.elements['new_password'].focus();
		return false;	
	} else if( new_password.length < 3 ) {
		alert(new_password_shorter);
		frm.elements['new_password'].focus();
		return false;
	} else if( comfirm_password.length == 0 ) {
		alert(new_password_empty);
		frm.elements['comfirm_password'].focus();
		return false;	
	} else if( comfirm_password.length < 3 ) {
		alert(new_password_shorter);
		frm.elements['comfirm_password'].focus();
		return false;
	} else if(comfirm_password != new_password ) {
		alert(comfirm_password_msg);
		frm.elements['comfirm_password'].focus();
		return false;
	}
}

/**
 * 修改密码时验证
 */
function checkResetAdminPwdForm() {
	var frm  = document.forms['resetPwdUser'];
	var new_password = frm.elements['new_password'].value;
	var comfirm_password = frm.elements['comfirm_password'].value;
	if( new_password.length == 0 ) {
		alert(new_password_empty);
		frm.elements['new_password'].focus();
		return false;	
	} else if( new_password.length < 3 ) {
		alert(new_password_shorter);
		frm.elements['new_password'].focus();
		return false;
	} else if( comfirm_password.length == 0 ) {
		alert(new_password_empty);
		frm.elements['comfirm_password'].focus();
		return false;	
	} else if( comfirm_password.length < 3 ) {
		alert(new_password_shorter);
		frm.elements['comfirm_password'].focus();
		return false;
	} else if(comfirm_password != new_password ) {
		alert(comfirm_password_msg);
		frm.elements['comfirm_password'].focus();
		return false;
	}
}

/**
 * 用户修改资料验证
 */
function checkUpdateInfoForm(){
	var regemail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)/;
	var regphone = /^[\d|\-|\s]+$/;
	var frm  = document.forms['formEdit'];
	var email = frm.elements['semail'].value;
	var tel = frm.elements['sphone'].value;
   if ( email.length == 0 ) {
		alert(email_empty);
		frm.elements['semail'].focus();
		return false;
	} else if ( !regemail.test(email) ) {
		alert(email_format);
		frm.elements['semail'].focus();
		return false;
	} else if ( tel.length == 0 ) {
		alert(phone_empty);
		frm.elements['sphone'].focus();
		return false;
	} else if ( !regphone.test(tel) ) {
		alert(phone_format);
		frm.elements['sphone'].focus();
		return false;
	} 
}

/**
 * 用户注册时验证
 */
function checkRegForm(){
	var reguname =  /^[a-zA-Z]+$/;
	var regemail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)/;
	var regphone = /^[\d|\-|\s]+$/;
	var frm  = document.forms['regUser'];
	var username  = trim(frm.elements['suser'].value);
	var password = frm.elements['spwd'].value;
	var password2 = frm.elements['spwd2'].value;
	var email = frm.elements['semail'].value;
	var tel = frm.elements['sphone'].value;
	var rand = frm.elements['rand'].value;
	if ( username.length == 0 ) {
		alert(username_empty);
		frm.elements['suser'].focus();
		return false;
	} else if ( username.length < 3 ) {
		alert(username_shorter);
		frm.elements['suser'].focus();
		return false;
	} else if ( !reguname.test(username) ) {
		alert(username_invalid);
		frm.elements['suser'].focus();
		return false;
	} else if ( password.length == 0 ) {
		alert(password_empty);
		frm.elements['spwd'].focus();
		return false;
	} else if ( password.length < 3 ) {
		alert(password_shorter);
		frm.elements['spwd'].focus();
		return false;
	} else if ( password2.length == 0  ) {
		alert(password_empty);
		frm.elements['spwd2'].focus();
		return false;
	} else if ( password2.length < 3 ) {
		alert(password_shorter);
		frm.elements['spwd2'].focus();
		return false;
	} else if ( password2 != password ) {
		alert(confirm_password_invalid);
		frm.elements['spwd2'].focus();
		return false;
	} else if ( email.length == 0 ) {
		alert(email_empty);
		frm.elements['semail'].focus();
		return false;
	} else if ( !regemail.test(email) ) {
		alert(email_format);
		frm.elements['semail'].focus();
		return false;
	} else if ( tel.length == 0 ) {
		alert(phone_empty);
		frm.elements['sphone'].focus();
		return false;
	} else if ( !regphone.test(tel) ) {
		alert(phone_format);
		frm.elements['sphone'].focus();
		return false;
	} else if ( rand.length < 4 ) {
		alert(rand_msg);
		frm.elements['rand'].focus();
		return false;
	}
}

/**
 * 后台管理员登陆时验证
 */
function checkAdminLoginForm() {
	var frm  = document.forms['AdminLogin'];
	var username  = trim(frm.elements['suser'].value);
	var password = frm.elements['spwd'].value;
	var rand = frm.elements['rand'].value;
	if ( username.length == 0 ) {
		alert(username_empty);
		frm.elements['suser'].focus();
		return false;
	} else if ( password.length == 0 ) {
		alert(password_empty);
		frm.elements['spwd'].focus();
		return false;
	} else if ( rand.length < 6 ) {
		alert(rand_msg);
		frm.elements['rand'].focus();
		return false;
	}
}


/**
 * 店家登陆时验证
 */
function checkSellerLoginForm() {
	var frm  = document.forms['SellerLogin'];
	var username  = trim(frm.elements['suser'].value);
	var password = frm.elements['spwd'].value;
	var rand = frm.elements['rand'].value;
	if ( username.length == 0 ) {
		alert(username_empty);
		frm.elements['suser'].focus();
		return false;
	} else if ( password.length == 0 ) {
		alert(password_empty);
		frm.elements['spwd'].focus();
		return false;
	} else if ( rand.length < 6 ) {
		alert(rand_msg);
		frm.elements['rand'].focus();
		return false;
	}
}
/**
 * 后台添加商品时验证
 */
function checkSellerAddFood() {
	var frm  = document.forms['foodAdd'];
	var mcname = trim(frm.elements['fname'].value);
	var mcprice = frm.elements['fprice'].value;
	var mcimg = frm.elements['fimg'].value;
	var flag = frm.elements['flag'].value;
	var price = mcprice.match(/^(-?\d+)(\.\d+)?$/);
	var img = /[Gg][Ii][Ff]|[Jj][Pp][Gg]|[Bb][Mm][Pp]|[Jj][Pp][Ee][Gg]/;
	if( mcname.length == 0 ) {
		alert(mcname_empty);
		frm.elements['fname'].focus();
		return false;
	}else if( mcprice.length == 0 ) {
		alert(mcprice_empty);
		frm.elements['fprice'].focus();
		return false;
	} else if(price==null) {
		alert(mcprice_msg);
		frm.elements['fprice'].focus();
		return false;
	} else if(flag.length==0) {
		if(mcimg.length==0) {
			alert(mcimg_empty);
			frm.elements['fimg'].focus();
			return false;
		} else if ( !img.test(mcimg.substring(mcimg.lastIndexOf('.')+1,mcimg.length)) ) {
			alert(mcimg_msg);
			frm.elements['fimg'].focus();
			return false;
		}
	}
}

/**
 * 后台修改商品时验证
 */
function checkSellerEditFood() {
	var frm  = document.forms['foodEdit'];
	var mcname = trim(frm.elements['fname'].value);
	var mcprice = frm.elements['fprice'].value;
	var mcimg = frm.elements['fimg'].value;
	var flag = frm.elements['flag'].value;
	var oldimg=document.getElementById('oldimg');
	var price = mcprice.match(/^(-?\d+)(\.\d+)?$/);
	var img = /[Gg][Ii][Ff]|[Jj][Pp][Gg]|[Bb][Mm][Pp]|[Jj][Pp][Ee][Gg]/;
	if( mcname.length == 0 ) {
		alert(mcname_empty);
		frm.elements['fname'].focus();
		return false;
	}else if( mcprice.length == 0 ) {
		alert(mcprice_empty);
		frm.elements['fprice'].focus();
		return false;
	} else if(price==null) {
		alert(mcprice_msg);
		frm.elements['fprice'].focus();
		return false;
	} else if(flag.length==0) {
		if(mcimg.length==0) {
			document.getElementById('flag').value=oldimg.value;
		} else if ( !img.test(mcimg.substring(mcimg.lastIndexOf('.')+1,mcimg.length)) ) {
			alert(mcimg_msg);
			frm.elements['fimg'].focus();
			return false;
		}
	}
}

/**
 * 下订单时数据验证
 */
function checkSendOrder() {
	var email = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)/;
	var phone = /^[\d|\-|\s]+$/;
	var scode = /[0-9]{6}/;
	var frm  = document.forms['sendorder'];
	var ssname = trim(frm.elements['ssname'].value);
	var ssaddress = frm.elements['ssaddress'].value;
	var ssphone = frm.elements['ssphone'].value;
	var ssemail = frm.elements['ssemail'].value;
	
	if( ssname.length == 0 ) {
		alert(ssname_empty);
		frm.elements['ssname'].focus();
		return false;
	} else if(ssaddress.length==0) {
		alert(ssaddress_empty);
		frm.elements['ssaddress'].focus();
		return false;
	} else if( ssphone.length == 0 ) {
		alert(ssphone_empty);
		frm.elements['ssphone'].focus();
		return false;
	} else if( ssemail.length == 0 ) {
		alert(ssemail_empty);
		frm.elements['ssemail'].focus();
		return false;
	} else if ( !email.test(ssemail) ) {
		alert(email_format);
		frm.elements['ssemail'].focus();
		return false;
	} else if ( !phone.test(ssphone) ) {
		alert(phone_format);
		frm.elements['ssphone'].focus();
		return false;
	}
}
		
/**
 * 去左右空格
 */
function trim( text ) {
	if (typeof(text) == "string") {
    	return text.replace(/^\s*|\s*$/g, "");
	} else {
    	return text;
	}
}

/* *
 * 检测密码强度
 * @param   string     pwd     密码
 */
function checkIntensity(pwd) {
	var Mcolor = "#FFF",Lcolor = "#FFF",Hcolor = "#FFF";
	var m=0,i=0;
	var Modes = 0;
	for ( i=0; i<pwd.length; i++) {
		var charType = 0;
		var t = pwd.charCodeAt(i);
		if (t>=48 && t <=57) {
			charType = 1;
		} else if (t>=65 && t <=90) {
			charType = 2;
		} else if (t>=97 && t <=122)
			charType = 4;
		else
			charType = 4;
			Modes |= charType;
	}
	for (i=0;i<4;i++) {
		if (Modes & 1) m++;
			Modes>>>=1;
	}
	if (pwd.length<=4) {
		m = 1;
	}
	switch(m) {
		case 1 :
			Lcolor = "2px solid red";
			Mcolor = Hcolor = "2px solid #DADADA";
			break;
		case 2 :
			Mcolor = "2px solid #f90";
			Lcolor = Hcolor = "2px solid #DADADA";
			break;
		case 3 :
			Hcolor = "2px solid #3c0";
			Lcolor = Mcolor = "2px solid #DADADA";
			break;
		case 4 :
			Hcolor = "2px solid #3c0";
			Lcolor = Mcolor = "2px solid #DADADA";
			break;
			default :
			Hcolor = Mcolor = Lcolor = "";
			break;
	}
	document.getElementById("pwd_lower").style.borderBottom  = Lcolor;
	document.getElementById("pwd_middle").style.borderBottom = Mcolor;
	document.getElementById("pwd_high").style.borderBottom   = Hcolor;
}

/* 修复IE6以下版本PNG图片Alpha */
function fixpng()
{
  var arVersion = navigator.appVersion.split("MSIE");
  var version = parseFloat(arVersion[1]);

  if ((version >= 5.5) && (document.body.filters))
  {
     for(var i=0; i<document.images.length; i++)
     {
        var img = document.images[i];
        var imgName = img.src.toUpperCase();
        if (imgName.substring(imgName.length-3, imgName.length) == "PNG")
        {
           var imgID = (img.id) ? "id='" + img.id + "' " : "";
           var imgClass = (img.className) ? "class='" + img.className + "' " : "";
           var imgTitle = (img.title) ? "title='" + img.title + "' " : "title='" + img.alt + "' ";
           var imgStyle = "display:inline-block;" + img.style.cssText;
           if (img.align == "left") imgStyle = "float:left;" + imgStyle;
           if (img.align == "right") imgStyle = "float:right;" + imgStyle;
           if (img.parentElement.href) imgStyle = "cursor:hand;" + imgStyle;
           var strNewHTML = "<span " + imgID + imgClass + imgTitle
           + " style=\"" + "width:" + img.width + "px; height:" + img.height + "px;" + imgStyle + ";"
           + "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader"
           + "(src=\'" + img.src + "\', sizingMethod='scale');\"></span>";
           img.outerHTML = strNewHTML;
           i = i-1;
        }
     }
  }
}