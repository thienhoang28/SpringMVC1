<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="newAPI" value="/api-admin-new"/>
<c:url var="editNewURL" value="/admin-new/edit"/>
<c:url var ="newURL" value="/admin-new/list"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="main-content">
	<div class="main-content-inner">
		<div class="breadcrumbs" id="breadcrumbs">
			<script type="text/javascript">
				try {
					ace.settings.check('breadcrumbs', 'fixed')
				} catch (e) {
				}
			</script>

			<ul class="breadcrumb">
				<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a>
				</li>

				<li><a href="#">Forms</a></li>
				<li class="active">Form Elements</li>
			</ul>
			<!-- /.breadcrumb -->
		</div>
		<div class="page-content">
			<div class="row">
				<div class="col-xs-12">
					<c:if test="${not empty message}">
						<div class="alert alert-${alert}">
  							${message}
						</div>
					</c:if>
					<form:form class="form-horizontal" role="form" id="formSubmit" modelAttribute="model">
						<div class="form-group">
							  <label for="categoryCode" class="col-sm-3 control-label no-padding-right">Categories:</label>
							  <div class="col-sm-9">
							  	 <form:select path="categoryCode" id="categoryCode" >
							  	 	<form:option value="" label="-- Select Option --"/>
							  	 	<form:options items="${categories}"/>
							  	 </form:select>
							  </div>
						</div>
						<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Title</label>
								<div class="col-sm-9">
									<form:input path="title" cssClass="col-xs-10 col-sm-5"/>
								</div>
						</div>
						<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">Thumbnail</label>
								<div class="col-sm-9">
									<input type="file" class="col-xs-10 col-sm-5" id="thumbnail" name="thumbnail"/>
								</div>
						</div>
						<div class="form-group">
						  	<label for="shortDescription" class="col-sm-3 control-label no-padding-right">Short Description</label>
						  	<div class="col-sm-9">
						  		<form:textarea path="shortDescription" rows="5" cols="10" cssClass="form-control" id="shortDescription" />
						  	</div>
						</div>
						<div class="form-group">
						  	<label for="content" class="col-sm-3 control-label no-padding-right">Content</label>
						  	<div class="col-sm-9">
						  		<form:textarea path="content" rows="5" cols="10" cssClass="form-control" id="content" name="content"/>
						  	</div>
						</div>
						<form:hidden path="id" id="newId"/>
						<div class="clearfix form-actions">
							<div class="col-md-offset-3 col-md-9">
								<c:if test="${not empty model.id}">
									<button class="btn btn-info" type="button" id="btnAddOrUpdateNew">
										<i class="ace-icon fa fa-check bigger-110"></i>
										Update New
									</button>
								</c:if>
								<c:if test="${empty model.id}">
									<button class="btn btn-info" type="button" id="btnAddOrUpdateNew">
										<i class="ace-icon fa fa-check bigger-110"></i>
										Add New
									</button>
								</c:if>

								&nbsp; &nbsp; &nbsp;
								<button class="btn" type="reset">
									<i class="ace-icon fa fa-undo bigger-110"></i>
									Cancel
								</button>
							</div>		
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	var editor1 = '';
	var editor2 = '';
	$(document).ready(function(){
		editor1 = CKEDITOR.replace('content');
		editor2 = CKEDITOR.replace('shortDescription');
	});
	
    $('#btnAddOrUpdateNew').click(function (e) {
        e.preventDefault();
        var data = {};
        var formData = $('#formSubmit').serializeArray();
        $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
        data["content"] = editor1.getData();
        data["shortDescription"] = editor2.getData();
        var id = $('#newId').val();
        if (id == "") {
            addNew(data);
        } else {
            updateNew(data);
        }
    });
    
    function addNew(data) {
        $.ajax({
            url: '${newAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${editNewURL}?id="+result.id+"&message=insert_success";
            },
            error: function (error) {
            	window.location.href = "${newURL}?page=1&limit=2&message=error_system";
            }
        });
    }
    
    function updateNew(data) {
        $.ajax({
            url: '${newAPI}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${editNewURL}?id="+result.id+"&message=update_success";
            },
            error: function (error) {
            	window.location.href = "${editNewURL}?id="+result.id+"&message=error_system";
            }
        });
    }
</script>
</body>
</html>