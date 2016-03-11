<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="avicit.platform6.commons.utils.ViewUtil"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
<base href="<%=ViewUtil.getRequestPath(request)%>">
<jsp:include page="/avicit/platform6/modules/system/sysuser/addhead.jsp"></jsp:include>
<style type="text/css">
.requiedbox {
	display: inline-block;
	white-space: nowrap;
	margin: 0;
	padding: 0;
	/* border-width: 1px;
	border-style: solid; */
	overflow: hidden;
}

.selectbox {
	display: inline-block;
	white-space: nowrap;
	margin: 0;
	padding: 0;
	border-width: 1px;
	border-style: solid;
	overflow: hidden;
}

.selectbox .selectbox-text {
	font-size: 12px;
	border: 0;
	margin: 0;
	padding: 0;
	line-height: 20px;
	height: 20px;
	*margin-top: -1px;
	*height: 18px;
	*line-height: 18px;
	_height: 18px;
	_line-height: 18px;
	vertical-align: baseline;
}

.selectbox-button {
	width: 18px;
	height: 20px;
	overflow: hidden;
	display: inline-block;
	vertical-align: top;
	cursor: pointer;
	/* opacity: 0.6;
	filter: alpha(opacity=60); */
}

.selectbox-button-hover {
	/* opacity: 1.0;
	filter: alpha(opacity=100); */
	
}

.selectbox {
	border-color: #95B8E7;
	background-color: #fff;
}

.selectbox-button {
	background:
		url('static/css/platform/themes/default/commonselection/icons_ext/selectorCommon.gif')
		no-repeat center center;
}

.required-icon {
	maring: 0px;
	padding: 0px;
	width: 10px;
	height: 23px;
	overflow: hidden;
	display: inline-block;
	vertical-align: top;
	/* opacity: 0.6; */
	/* 	filter: alpha(opacity=60); */
	background:
		url('static/css/platform/themes/default/public/images/required.gif')
		no-repeat center center;
}

.datagrid-toolbar-extend {
	height: auto;
	padding: 1px 0;
	border-width: 0 0 1px 0;
	border-style: solid;
	position: absolute;
	bottom: 0px;
	left: 0px;
	width: 100%;
}

.numberBox_extend {
	border: 1px solid #0066FF;
	height: 18px;
}

.inputbox {
	background-color: #fff;
	border: 1px solid #95b8e7;
	color: #000;
	height: 18px;
}

.easyui-numberbox {
	border: 1px solid #95b8e7;
}
</style>
</head>
<body class="easyui-layout">
	<div data-options="region:'center',split:true,border:false"
		style="overflow:hidden;padding-bottom:35px;">
		<div id="editSysUserTabs" class="easyui-tabs"
			data-options="fit:true,plain:true,tabPosition:'top',toolPosition:'right'"
			style="padding:0 0 1px">
			<!-- 基本信息选项卡 -->
			<div title="基本信息" data-options="iconCls:'icon-org-user'">
				<form id="formAddBaseInfo" method="post">
					<table>
						<tr>
							<td width="80" align="right"><input title="用户主键"
								type="hidden" name="id" id="id" value="${userId}" /> <label>用户编号</label>
							</td>
							<td align="right" width="170"><span class="requiedbox"
								style="width: 170px;"> <span> <span
										class="required-icon"></span>
								</span> <input title="用户编号" class="easyui-validatebox" type="text"
									name="no" id="no" data-options="required:true"
									onblur="checkUserCode(this,'');"
									onfocus="checkInUserCode(this);" />
							</span></td>
							<td align="right" valign="top" style="padding-bottom: 6px;"
								rowspan="6">
								<div style="margin-left:20px;">
									<img title='上传个人头像文件' id="sysUserHeadPhotoImg"
										src="static/images/platform/sysuser/userPhoto.gif"
										width="110px" height="120px" name="sysUserHeadPhotoImg"
										style="cursor:pointer;" onclick="chooseUserPhoto();" />
								</div>
							</td>
							<td align="right" valign="top" style="padding-bottom: 6px;"
								rowspan="6">
								<div style="margin-left:10px;">
									<img name="sysUserSignPhotoImg"
										src="static/images/platform/sysuser/userSign.gif" width="110"
										height="120" title="上传个人签名图片文件" id="sysUserSignPhotoImg"
										style="cursor: pointer;" onclick="chooseUserSign();" />
								</div>
							</td>
						</tr>
						<tr>
							<td width="80" align="right"><label>登录名</label></td>
							<td align="right" width="170"><span class="requiedbox"
								style="width: 170px; height: 23px;"> <span> <span
										class="required-icon"></span>
								</span> <input title="登录名" class="easyui-validatebox" type="text"
									name="loginName" id="loginName" data-options="required:true"
									onblur="checkLoginName(this,'');"
									onfocus="checkInLoginName(this);" />
							</span></td>
						</tr>
						<tr>
							<td width="80" align="right"><label>用户姓名</label></td>
							<td align="right" width="170"><span class="requiedbox"
								style="width: 170px; height: 23px;"> <span> <span
										class="required-icon"></span>
								</span> <input title="用户姓名" class="easyui-validatebox" type="text"
									name="name" id="name" data-options="required:true" />
							</span></td>
						</tr>
						<tr>
							<td width="80" align="right"><label>英文名</label></td>
							<td align="right" width="170"><input title="英文名"
								class="easyui-validatebox" type="text" name="nameEn" id="nameEn" />
							</td>
						</tr>
						<tr>
							<td width="80" align="right"><label>所在部门</label></td>
							<td align="right" width="170">
							<input type="hidden" name="deptId" id="deptId" value="${deptId}"/> 
							<span class="requiedbox" style="width: 170px;_width:170px; height: 23px;"> 
								<span>
									<span class="required-icon"></span>
								</span> 
								<span class="selectbox" style="width: 151px;_width:151px; height: 20px;"> 
									<input type="text" id="deptName" class="selectbox-text easyui-validatebox" data-options="required:true" name="deptName" readonly="readonly" style="width: 128px; height: 20px; line-height: 20px;" value="${deptName}" /> 
								<span> 
									<span class="selectbox-button" onclick="mySelectDept();" style="height: 20px;"></span>
								</span>
								</span>
							</span></td>
						</tr>
						<tr>
							<td width="80" align="right"><label>密级</label></td>
							<td align="right" width="170"><span
								style="width: 150px; height: 20px;"> <select
									class="easyui-combobox"
									data-options="{required:true,panelHeight:'auto',editable:false,width:'151'}"
									name="secretLevel" id="secretLevel" <c:if test="${isNotSaveManager}">readonly='readonly'</c:if>>
										<c:forEach items="${secret}" var="secret">
											<option value="${secret.lookupCode}"
												<c:if test="${secret.lookupCode eq defsecretLevel}">SELECTED</c:if>>${secret.lookupName}</option>
										</c:forEach>
								</select></td>
						</tr>
					</table>
					<table>
						<tr>
							<td width="80" align="right"><label>岗位名称</label></td>
							<td align="right" width="170"><input type="hidden"
								name="positionId" id="positionId" value="${defpositionId}" /> <span
								class="requiedbox"
								style="width: 168px;_width:170px; height: 23px;"> <span>
										<span class="required-icon"></span>
								</span> <span class="selectbox"
									style="width: 151px;_width:151px; height: 20px;"> <input
										type="text" id="positionName"
										class="selectbox-text easyui-validatebox"
										data-options="required:true" name="positionName"
										readonly="readonly"
										style="width: 128px; height: 20px; line-height: 20px;"
										value="${defpositionName}" /> <span> <span
											class="selectbox-button" onclick="mySelectPos();"
											style="height: 20px;"></span>
									</span>
								</span>
							</span></td>
							<td width="70" align="right"><label>是否主管</label></td>
							<td><c:forEach items="${isManager}" var="isManager">
									<input type="radio" id="isManager${isManager.lookupCode}"
										name="isManager" value="${isManager.lookupCode}"
										<c:if test="${isManager.lookupCode eq  defisManager}">checked="true"</c:if> />
									<span><label for="isManager${isManager.lookupCode}">${isManager.lookupName}</label></span>
								</c:forEach></td>

						</tr>
						<tr>
							<td width="80" align="right"><label>角色名称</label></td>
							<td align="right" width="168"><input type="hidden"
								name="ruleId" id="ruleId" value="${defruleId}" /> <span
								class="requiedbox"
								style="width: 168px;_width:170px; height: 23px;"> <span>
										<span class="required-icon"></span>
								</span> <span class="selectbox"
									style="width: 151px;_width:151px; height: 20px;"> <input
										type="text" id="ruleName"
										class="selectbox-text easyui-validatebox"
										data-options="required:true" name="ruleName"
										readonly="readonly"
										style="width: 
										<c:choose>
											<c:when test="${isNotSaveManager}">
												151px
											</c:when>
											<c:otherwise>
												128px
											</c:otherwise>
										</c:choose>; 
										height: 20px; line-height: 20px;"
										value="${defruleName}" /> <span> <span
											class="selectbox-button" onclick="mySelectRole();"
											style="height: 20px;<c:if  test="${isNotSaveManager}">display:none</c:if>" </span>
									</span>
								</span>
							</span></td>
							<td width="70" align="right"><label>类型</label></td>
							<td><input type="radio" id="typeC" name="type" value="0"
								checked="true" /><span><label for="typeC">自定义用户</label></span> <input
								type="radio" id="typeS" name="type" value="1" /><span><label
									for="typeS">系统用户</label></span></td>
						</tr>
						<tr>
							<td width="80" align="right"><label>语言</label></td>
							<td align="right" width="168"><select
								class="easyui-combobox"
								data-options="{required:true,panelHeight:'auto',editable:false,width:'151'}"
								name="languageCode" id="languageCode">
									<c:forEach items="${language}" var="language">
										<option value="${language.languageCode}"
											<c:if test="${language.languageCode eq deflanguageCode}">SELECTED</c:if>>${language.languageName}</option>
									</c:forEach>
							</select></td>
							<td width="70" align="right"><label>性别</label></td>
							<td><c:forEach items="${sex}" var="sex">
									<input type="radio" id="sex${sex.lookupCode}" name="sex"
										value="${sex.lookupCode}"
										<c:if test="${sex.lookupCode eq defsex}">checked="true"</c:if> />
									<span><label for="sex${sex.lookupCode}">${sex.lookupName}</label></span>
								</c:forEach></td>
						</tr>
						<tr>
							<td width="80" align="right"><label>职称</label></td>
							<td align="right" width="168"><input
								class="easyui-validatebox" type="text" name="title" id="title" />
							</td>
							<td width="70" align="right"><label>状态</label></td>
							<td><c:forEach items="${status}" var="status">
									<input type="radio" id="status${status.lookupCode}"
										name="status" value="${status.lookupCode}"
										<c:if test="${status.lookupCode eq  defstatus}">checked="true"</c:if> />
									<span><label for="status${status.lookupCode}">${status.lookupName}</label></span>
								</c:forEach></td>
						</tr>
						<tr>
							<td width="80" align="right"><label>民族</label></td>
							<td align="right" width="168"><select
								class="easyui-combobox"
								data-options="{required:true,panelHeight:'auto',editable:false,width:'151'}"
								name="nation" id="nation" title="民族">
									<c:forEach items="${nation}" var="nation">
										<option value="${nation.lookupCode}">${nation.lookupName}</option>
									</c:forEach>
							</select></td>
							<td width="70" align="right"><label>籍贯</label></td>
							<td><input title="籍贯" class="inputbox" type="text"
								name="birthAddress" id="birthAddress"
								value="${sysUser.birthAddress}" /></td>
						</tr>
						<tr>
							<td width="80" align="right"><label>政治面貌</label></td>
							<td align="right" width="168"><select
								class="easyui-combobox"
								data-options="{required:true,panelHeight:'auto',editable:false,width:'151'}"
								name="polity" id="polity" title="政治面貌">
									<c:forEach items="${political}" var="political">
										<option value="${political.lookupCode}">${political.lookupName}</option>
									</c:forEach>
							</select></td>
							<td width="70" align="right"><label>工作日期</label></td>
							<td><input title="工作日期"
								class="easyui-datebox easyui-validatebox"
								data-options="{width:'151'}" validType="past" type="text"
								name="workDate" id="workDate" /></td>
						</tr>
						<tr>
							<td width="80" align="right"><label>学历</label></td>
							<td align="right" width="168"><select
								class="easyui-combobox"
								data-options="{panelHeight:'auto',editable:false,width:'151'}"
								name="degree" id="degree" title="学历">
									<c:forEach items="${degree}" var="degree">
										<option value="${degree.lookupCode}">${degree.lookupName}</option>
									</c:forEach>
							</select></td>
							<td width="70" align="right"><label>生日</label></td>
							<td><input title="生日"
								class="easyui-datebox easyui-validatebox"
								data-options="{width:'151'}" validType="past" type="text"
								name="birthday" id="birthday" /></td>
						</tr>
						<tr>
							<td width="80" align="right"><label>毕业院校</label></td>
							<td align="right" width="168"><input title="毕业院校"
								class="inputbox" type="text" name="education" id="education" />
							</td>
							<td width="70" align="right"><label>手机</label></td>
							<td><input title="手机" class="easyui-numberbox" type="text"
								name="mobile" id="mobile" /></td>
						</tr>
						<tr>
							<td width="80" align="right"><label>办公电话</label></td>
							<td align="right" width="168"><input title="办公电话"
								class="easyui-numberbox" type="text" name="officeTel"
								id="officeTel" /></td>
							<td width="70" align="right"><label>传真</label></td>
							<td><input title="传真" class="easyui-numberbox" type="text"
								name="fax" id="fax" /></td>
						</tr>
						<tr>
							<td width="80" align="right"><label>邮箱地址</label></td>
							<td align="right" width="168"><input class="inputbox"
								data-options="validType:'email'" type="text" name="email"
								id="email" /></td>
							<td width="70" align="right"><label>工作地点</label></td>
							<td><input title="工作地点" class="inputbox" type="text"
								name="workSpace" id="workSpace" /></td>
						</tr>
						<tr>
							<td width="80" align="right"><label>房间号</label></td>
							<td align="right" width="168"><input title="房间号"
								class="inputbox" type="text" name="roomNo" id="roomNo" /></td>
							<td width="70" align="right"><label>家庭住址</label></td>
							<td><input title="家庭住址" class="inputbox" type="text"
								name="homeAddress" id="homeAddress" /></td>
						</tr>
						<tr>
							<td width="80" align="right"><label>家庭邮编</label></td>
							<td align="right" width="168"><input title="家庭邮编"
								class="inputbox" type="text" name="homeZip" id="homeZip" /></td>
							<td width="70" align="right"><label>家庭电话</label></td>
							<td><input class="inputbox" type="text" name="homeTel"
								id="homeTel" /></td>
						</tr>
						<tr>
							<td width="80" align="right"><label>排序编号</label></td>
							<td align="right" width="168"><input title="排序编号"
								class="easyui-numberbox" type="text" name="orderBy" id="orderBy" />
							</td>
							<td width="80" align="right"><label>集团编码</label></td>
							<td><input title="集团编码" class="easyui-validatebox"
								type="text" name="unitCode" id="unitCode"
								onblur="checkUnitCode(this,'');"
								onfocus="checkInUnitCode(this);" /></td>
						</tr>
						<tr>
							<td width="80" align="right" valign="top"><label>描述</label>
							</td>
							<td align="right" width="168" colspan="3"
								style="_padding-left:16px;"><textarea
									class="inputbox scrollbar"
									style="height:50px;width:391px;_width:397px;" rows="4"
									id="remark" name="remark">${sysUser.remark}</textarea></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<!-- 底部控制按钮 -->
	<div id="toolbar" class="datagrid-toolbar datagrid-toolbar-extend">
		<table class="tableForm" border="0" cellspacing="1" width='100%'>
			<tr>
				<td width="60%" align="right"><a title="保存" id="saveButton"
					class="easyui-linkbutton" iconCls="" plain="false"
					onclick="saveForm();" href="javascript:void(0);">保存</a> <a
					title="保存" id="saveAndNewButton" class="easyui-linkbutton"
					iconCls="" plain="false" onclick="saveAddForm();"
					href="javascript:void(0);">保存并继续</a> <a title="返回"
					id="returnButton" class="easyui-linkbutton" iconCls=""
					plain="false" onclick="closeForm();" href="javascript:void(0);">返回</a>


				</td>
				<!-- <td  align="right" width="" align="right"></td>
				<td align="right"></td> -->
			</tr>
		</table>
	</div>
	<!--上传用户头像对话框  -->
	<div id="addUserPhotoDialog" class="easyui-dialog"
		data-options="iconCls:'icon-add',resizable:true,modal:false,title:'上传头像'"
		style="width: 600px;height:200px;">
		<form action="platform/sysuser/photo/upload/headerphoto" method="post"
			id="uploadForm" enctype="multipart/form-data"
			style="margin-top: 20px;">
			<table width="100%" border="0">
				<tr>
					<td width="10%" align="right" nowrap="nowrap">选择本地头像文件</td>
					<td width="90%" align="left"><input type=file
						style='width:90%' id=sysUserPhoto name=sysUserPhoto></td>
				</tr>
			</table>
			<input type=hidden id="headerPhoto_sysUserId"
				name="headerPhoto_sysUserId" value="${userId}" />
		</form>
		<div id="upLoadPhotoToolbar"
			class="datagrid-toolbar datagrid-toolbar-extend"
			style="height:auto;display: block;">
			<table class="tableForm" width='100%'>
				<tr>
					<td align="right"><a title="上传" id="upLoadButton"
						class="easyui-linkbutton" iconCls="icon-save" plain="false"
						onclick="upLoadUserPhoto();" href="javascript:void(0);">上传</a></td>
					<td><a title="关闭" id="returnButton" class="easyui-linkbutton"
						iconCls="icon-undo" plain="false"
						onclick="closeUpLoadUserPhoto();" href="javascript:void(0);">关闭</a></td>
				</tr>
			</table>
		</div>
	</div>
	<!-- 上传签名文件对话框 -->
	<div id="addUserSignDialog" class="easyui-dialog"
		data-options="iconCls:'icon-add',resizable:true,modal:false,title:'上传签名'"
		style="width: 600px;height:200px;">
		<form action="platform/sysuser/photo/upload/signphoto" method="post"
			id="uploadPersionSignForm" enctype="multipart/form-data"
			style="margin-top: 20px;">
			<table width="100%" border="0">
				<tr>
					<td width="10%" align="right" nowrap="nowrap">选择本地签名文件</td>
					<td width="90%" align="left"><input type=file
						style='width:90%' id=sysUserSign name=sysUserSign></td>
				</tr>
			</table>
			<input type=hidden id="signPhoto_sysUserId"
				name="signPhoto_sysUserId" value="${userId}" />
		</form>
		<div id="upLoadSignToolbar"
			class="datagrid-toolbar datagrid-toolbar-extend"
			style="height:auto;display: block;">
			<table class="tableForm" width='100%'>
				<tr>
					<td align="right"><a title="上传" id="upLoadSignButton"
						class="easyui-linkbutton" iconCls="icon-save" plain="false"
						onclick="upLoadUserSign();" href="javascript:void(0);">上传</a></td>
					<td><a title="关闭" id="returnSignButton"
						class="easyui-linkbutton" iconCls="icon-undo" plain="false"
						onclick="closeUpLoadUserSign();" href="javascript:void(0);">关闭</a></td>
				</tr>
			</table>
		</div>
	</div>
	<script type="text/javascript">
		var sysUserId;
		$(function() {
			$('#addUserPhotoDialog').dialog('close', true);
			$('#addUserSignDialog').dialog('close', true);
			sysUserId = '${userId}';
			setTimeout(loadJs, 200);
		});
		function loadJs() {

			var doc = document;
			var scriptElement = doc.createElement('script');

			scriptElement.src = "avicit/platform6/modules/system/sysuser/js/addjs/addJs.js";
			doc.getElementsByTagName('head')[0].appendChild(scriptElement);

			scriptElement = doc.createElement('script');
			scriptElement.src = "avicit/platform6/modules/system/sysuser/js/addEditUtil.js";
			doc.getElementsByTagName('head')[0].appendChild(scriptElement);

			scriptElement = doc.createElement('script');
			scriptElement.src = "static/js/platform/component/commonselection/CommonSelectorDialog.js";
			doc.getElementsByTagName('head')[0].appendChild(scriptElement);

			scriptElement = doc.createElement('script');
			scriptElement.src = "static/js/platform/component/commonselection/commonSelectionUtil.js";
			doc.getElementsByTagName('head')[0].appendChild(scriptElement);

			scriptElement = doc.createElement('script');
			scriptElement.src = "static/js/platform/component/common/json2.js";
			doc.getElementsByTagName('head')[0].appendChild(scriptElement);

			scriptElement = doc.createElement('script');
			scriptElement.src = "static/js/platform/component/common/exteasyui.js";
			doc.getElementsByTagName('head')[0].appendChild(scriptElement);
		}
	</script>
</body>
</html>