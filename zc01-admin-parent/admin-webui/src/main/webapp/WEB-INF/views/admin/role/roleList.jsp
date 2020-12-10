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
                        <i class="glyphicon glyphicon-th"></i> 数据列表
                    </h3>
                </div>
                <div class="panel-body">
                    <form class="form-inline" role="form" style="float: left;">
                        <div class="form-group has-feedback">
                            <div class="input-group">
                                <div class="input-group-addon">查询条件</div>
                                <input class="form-control has-success" type="text" placeholder="请输入查询条件">
                            </div>
                        </div>
                        <button type="button" class="btn btn-warning">
                            <i class="glyphicon glyphicon-search"></i> 查询
                        </button>
                    </form>
                    <button type="button" class="btn btn-danger"
                            style="float: right; margin-left: 10px;">
                        <i class=" glyphicon glyphicon-remove"></i> 删除
                    </button>
                    <button type="button" class="btn btn-primary"
                            style="float: right;" onclick="window.location.href='add.html'">
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
    //页面是请求RESTFUL风格的API显示
    /**
     * 查询第N页的数据
     * @param pageNum   页码
     * @param pageSize  每页的显示条数
     */
    function queryData(pageNum, pageSize) {
        console.log("跳转至第" + pageNum + "页,显示：" + pageSize + "条数据");
        let url = "${pageContext.request.contextPath}" + "/role?pageNum="+pageNum+"&pageSize="+pageSize;
        $.ajax({
            async: false,//异步请求
            cache: true,
            url: url,
            contentType: "application/json",
            data: {//可以封装查询条件
                // id: "1",
                // acctId: "admin",
                // nickName: "管理员"
            },
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
            $("#" + tableId).html(row);
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
        console.log(rs);
        let pageNum = rs.data.pageNum;
        let pageSize = rs.data.pageSize;
        const options = {
            bootstrapMajorVersion: 3,//bootstrap版本
            alignment: "center",//居中显示
            currentPage: pageNum,//当前页数
            totalPages: pageSize,//总页数 注意不是总条数
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
                    return "javascript:queryData('" + page + "','')";
                    // return queryData(pageNum, pageSize);
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