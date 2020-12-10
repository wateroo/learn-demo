<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<%@include file="/WEB-INF/views/common/include-head.jsp" %>
<body>
<%@ include file="/WEB-INF/views/common/include-nav.jsp" %>
<div class="container-fluid">
    <div class="row">
        <%@ include file="/WEB-INF/views/common/include-sidebar.jsp" %>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <i class="glyphicon glyphicon-th"></i> 新增角色
                    </h3>
                </div>
                <div class="panel-body">
                    <form class="form-inline" role="form" style="float: left;" id="searchForm">
                        <div class="form-group has-feedback">
                            <div class="input-group">
                                <div class="input-group-addon">角色名</div>
                                <input name="roleName" class="form-control has-success" type="text"
                                       placeholder="请输入查询条件">
                            </div>
                            <div class="input-group">
                                <div class="input-group-addon">状态</div>
                                <select name="roleStatus" class="form-control has-success">
                                    <option value="" selected="selected">--请选择--</option>
                                    <option value="0">禁用</option>
                                    <option value="1">启用</option>
                                </select>
                            </div>
                        </div>
                        <button type="button" class="btn btn-warning" onclick="queryData('','3');">
                            <i class="glyphicon glyphicon-search"></i> 查询
                        </button>
                    </form>
                    <button type="button" class="btn btn-danger"
                            style="float: right; margin-left: 10px;">
                        <i class=" glyphicon glyphicon-remove"></i> 删除
                    </button>
                    <button type="button" class="btn btn-primary"
                            style="float: right;" onclick="window.location.href='role/add.html'">
                        <i class="glyphicon glyphicon-plus"></i> 新增
                    </button>
                    <br>
                    <hr style="clear: both;">
                    <div class="table-responsive">
                        <table class="table  table-bordered">
                            <thead>
                            <tr>
                                <th width="30">#</th>
                                <th width="30"><input type="checkbox"></th>
                                <th>角色名称</th>
                                <th>状态</th>
                                <th width="100">操作</th>
                            </tr>
                            </thead>
                            <tbody id="tb">
                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="6" align="center">
                                    <ul class="pagination" id="pagination"></ul>
                                </td>
                            </tr>

                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function getSearchParams() {
        const formObject = {};
        const formArray = $("#searchForm").serializeArray();
        $.each(formArray, function (i, item) {
            if (item.value.trim() != "") {
                formObject[item.name] = item.value;
            }
        });
        // const formJson = JSON.stringify(formObject);
        // console.log(formJson);
        return formObject;
    }

    //页面是请求RESTFUL风格的API显示
    /**
     * 查询第N页的数据
     * @param pageNum   页码
     * @param pageSize  每页的显示条数
     */
    function queryData(pageNum, pageSize) {
        console.log("跳转至第" + pageNum + "页,显示：" + pageSize + "条数据");
        let url = "${pageContext.request.contextPath}" + "/role?pageNum=" + pageNum + "&pageSize=" + pageSize;
        $.ajax({
            async: false,//异步请求
            cache: true,
            url: url,
            contentType: "application/json",
            data: getSearchParams(),
            dataType: "json",
            type: "GET",
            error: function () {
                console.log("请求失败时调用此函数");
            },
            success: function (data) {
                console.log("请求成功时调用此函数");
                console.log(data);
                renderTableTbody(data);
                renderPage(data);
            }
        });
    }

    function renderTableTbody(rs) {
        const size = rs.data.list.length;
        if (size == 0) {
            const row = '<tr><td colspan="6" align="center">抱歉！没有查询到您要的数据！!</td></tr>';
            $("#tb").html(row);
            return;
        }
        let html = "";
        $(rs.data.list).each(function (index) {
            const row = "<tr>" +
                "<td>" + (index + 1) + "</td>" +
                "<td><input type='checkbox'></td>" +
                "<td>" + rs.data.list[index].roleName + "</td>" +
                "<td>" + getStatus(rs.data.list[index].roleStatus) + "</td>" +
                "<td>" +
                "<button type='button' class='btn btn-success btn-xs'>" +
                "<i class='glyphicon glyphicon-check'></i>" +
                "</button>" +
                "<button type='button' class='btn btn-primary btn-xs'>" +
                "<i class='glyphicon glyphicon-pencil'></i>" +
                "</button>" +
                "<button type='button' class='btn btn-danger btn-xs'>" +
                "<i class='glyphicon glyphicon-remove'></i>" +
                "</button>" +
                "</td>" +
                "</tr>";
            html += row;
        });
        $("#tb").html(html);
    }

    function renderPage(rs) {
        let size = rs.data.list.length;
        console.log(rs);
        let numberOfPages = 5;//默认显示5页操作按钮
        let pageNum = rs.data.pageNum;
        let pages = rs.data.pages;
        let pageSize = rs.data.pageSize;
        if (size == 0) {//查询记录为空就不分页
            return;
        } else {
            //这儿主要是控制页码显示，当实际页码数量小于默认页码数量的时候就按实际页数显示，否则就是显示默认的页码数量
            Math.ceil(rs.data.total / pageSize) <= 5 ? numberOfPages = Math.ceil(rs.data.total / pageSize) : 5;
            console.log(numberOfPages);
        }
        const options = {
            bootstrapMajorVersion: 3,//bootstrap版本
            size: "normal",
            alignment: "center",//居中显示
            currentPage: pageNum,//当前页数
            totalPages: pages,//总页数 注意不是总条数
            numberOfPages: numberOfPages,
            showColumns: true,                  //是否显示所有的列
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            itemContainerClass: function (type, page, current) {
                return (page === current) ? "active" : "cursor";     //设置当前光标为小手状态
            },
            itemTexts: function (type, page, current) {
                switch (type) {
                    case "first":
                        return "首页";
                    case "prev":
                        return "上一页";
                    case "next":
                        return "下一页";
                    case "last":
                        return "末页";
                    case "page":
                        return page;
                }
            },//改写分页按钮字样
            pageUrl: function (type, page, current) {
                if (page == current) {
                    return "javascript:void(0)";
                } else {
                    return "javascript:queryData('" + page + "','" + pageSize + "')";
                }
            }
        };

        $("#pagination").bootstrapPaginator(options);// $("#pagintor") Bootstrap 是2.X 使用div元素，3.X使用ul元素
    }

    function getStatus(status) {
        return status == 1 ? "启用" : "注销";
    }


    $(function () {
        queryData(1, 5);
    });


</script>
</body>
</html>