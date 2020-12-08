<!DOCTYPE html>
<!-- saved from url=(0052)http://getbootstrap.com/docs/4.0/examples/dashboard/ -->
<html lang="en" xmlns:th="http://www.thymeleaf.org">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>人员管理</title>
    <!-- Bootstrap core CSS -->
    <link href="/static/asserts/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/static/asserts/css/dashboard.css" rel="stylesheet">
    <style type="text/css">
        /* Chart.js */

        @-webkit-keyframes chartjs-render-animation {
            from {
                opacity: 0.99
            }
            to {
                opacity: 1
            }
        }

        @keyframes chartjs-render-animation {
            from {
                opacity: 0.99
            }
            to {
                opacity: 1
            }
        }

        .chartjs-render-monitor {
            -webkit-animation: chartjs-render-animation 0.001s;
            animation: chartjs-render-animation 0.001s;
        }
    </style>
</head>

<body>
<!--引入顶部工具栏top bar-->
<div th:replace="common/bar::top_bar"></div>

<div class="container-fluid">
    <div class="row">
        <!--引入侧边栏side bar-->
        <div th:replace="common/bar::#side_bar(activeUri='users')"></div>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
            <h2><a class="btn btn-sm btn-success" href="user" th:href="user">添加</a></h2>
            <div class="table-responsive">
                <table class="table table-striped table-sm">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>用户名</th>
                        <th>年龄</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr th:each="list:${pageInfo.list}">
                        <td th:text="${list.id}"></td>
                        <td th:text="${list.name}"></td>
                        <td th:text="${list.age}"></td>
                        <td>
                            <a class="btn btn-sm btn-primary" th:href="@{/user/}+${list.id}">编辑</a>
                            <button th:attr="del_uri=@{/user/}+${list.id}" class="btn btn-sm btn-danger deleteBtn">删除
                            </button>
                        </td>
                    </tr>
                    </tbody>
                </table>


                <div class="modal-footer no-margin-top">
                    <div class="col-md-6">
                        当前第 [[${pageInfo.pageNum}]]页,共 [[${pageInfo.pages}]] 页.一共 [[${pageInfo.total}]] 条记录
                    </div>
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <li class="page-item" id="top">
                                <a class="page-link" th:href="@{/users?start=1}" tabindex="-1"
                                   aria-disabled="true">首页</a>
                            </li>
                            <!--上一页，如果时第一页 就不显示了  -->
                            <li class="page-item" id="left">
                                <a class="page-link" th:href="'/users?start='+${pageInfo.prePage}"
                                   th:if="${pageInfo.hasPreviousPage}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <!-- active-->

                            <li class="page-item" th:each="nav:${pageInfo.navigatepageNums}"
                                th:class="${nav!=pageInfo.pageNum?'page-item':'page-item active'}">
                                <!--th:if="${nav != pageInfo.pageNum}"  ${pageInfo.pageNum}-->
                                <a class="page-link" th:href="'/users?start='+${nav}" th:text="${nav}"></a>

                                <!-- <span style="font-weight: bold;background: #6faed9;" th:if="${nav == pageInfo.pageNum}" th:text="${nav}"></span>-->
                            </li>

                            <!--                        <li class="page-item"><a class="page-link" href="#">1</a></li>-->


                            <!--                        <li class="page-item active"><a class="page-link" href="#">2</a></li>-->
                            <!--                        <li class="page-item"><a class="page-link" href="#">3</a></li>-->
                            <li class="page-item" id="right">
                                <a class="page-link" th:href="'/users?start='+${pageInfo.pageNum+1}" aria-label="Next"
                                   th:if="${pageInfo.hasNextPage}">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                            <li class="page-item " id="last">
                                <a class="page-link" th:href="@{/users?start=}+${pageInfo.pages}" tabindex="-1"
                                   aria-disabled="true">尾页</a>
                            </li>
                        </ul>
                    </nav>
                </div>


                <!--显示分页信息-->
                <!--<div class="modal-footer no-margin-top">
                    <div class="col-md-6">
                        当前第 [[${pageInfo.pageNum}]]页,共 [[${pageInfo.pages}]] 页.一共 [[${pageInfo.total}]] 条记录
                    </div>

                    <ul class="pagination pull-right no-margin">
                        <li th:if="${pageInfo.hasPreviousPage}">
                            <a th:href="'/users?start=1'" class="page-link">首页</a>
                        </li>

                        <li  class="page-item "  th:if="${pageInfo.hasPreviousPage}">
                            <a th:href="'/users?start='+${pageInfo.prePage}" class="page-link">
                               &lt;!&ndash; <i class="ace-icon fa fa-angle-double-left"></i>&ndash;&gt;
                            </a>
                        </li>
                        &lt;!&ndash;遍历条数&ndash;&gt;
                        <li th:each="nav:${pageInfo.navigatepageNums}"  class="page-item ">
                            <a th:href="'/users?start='+${nav}" th:text="${nav}"
                               th:if="${nav != pageInfo.pageNum}" class="page-link"></a>
                           &lt;!&ndash; <span style="font-weight: bold;background: #6faed9;" th:if="${nav == pageInfo.pageNum}" class="page-link"
                                  th:text="${nav}"></span>&ndash;&gt;
                        </li>

                        <li th:if="${pageInfo.hasNextPage}"  th:if="${pageInfo.hasNextPage}" class="page-item ">
                            <a th:href="'/users?start='+${pageInfo.nextPage}" class="page-link">
                               &lt;!&ndash; <i class="ace-icon fa fa-angle-double-right"></i>&ndash;&gt;
                            </a>
                        </li>

                        <li  class="page-item ">
                            <a th:href="'/users?start='+${pageInfo.pages}" class="page-link">尾页</a>
                        </li>
                    </ul>
                </div>-->

                <div>当前页号：<span th:text="${pageInfo.pageNum}"></span></div>
                <div>每页条数：<span th:text="${pageInfo.pageSize}"></span></div>
                <div>起始行号：<span th:text="${pageInfo.startRow}"></span></div>
                <div>终止行号：<span th:text="${pageInfo.endRow}"></span></div>
                <div>总结果数：<span th:text="${pageInfo.total}"></span></div>
                <div>总页数：<span th:text="${pageInfo.pages}"></span></div>
                <hr/>
                <div>是否为第一页：<span th:text="${pageInfo.isFirstPage}"></span></div>
                <div>是否为最后一页：<span th:text="${pageInfo.isLastPage}"></span></div>
                <div>是否有前一页：<span th:text="${pageInfo.hasPreviousPage}"></span></div>
                <div>是否有下一页：<span th:text="${pageInfo.hasNextPage}"></span></div>

            </div>
        </main>
        <form id="deleteEmpForm" method="post">
            <input type="hidden" name="_method" value="delete"/>
        </form>
    </div>
</div>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script type="text/javascript" src="/static/asserts/js/jquery-3.2.1.slim.min.js"></script>
<script type="text/javascript" src="/static/asserts/js/popper.min.js"></script>
<script type="text/javascript" src="/static/asserts/js/bootstrap.min.js"></script>

<!-- Icons -->
<script type="text/javascript" src="/static/asserts/js/feather.min.js"></script>
<script>
    feather.replace()
</script>
<script>
    $(".deleteBtn").click(function () {
        //删除当前员工的
        $("#deleteEmpForm").attr("action", $(this).attr("del_uri")).submit();
        return false;
    });
</script>
<!-- Graphs -->
<script type="text/javascript" src="/static/asserts/js/Chart.min.js"></script>
<script>
    var ctx = document.getElementById("myChart");
    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
            datasets: [{
                data: [15339, 21345, 18483, 24003, 23489, 24092, 12034],
                lineTension: 0,
                backgroundColor: 'transparent',
                borderColor: '#007bff',
                borderWidth: 4,
                pointBackgroundColor: '#007bff'
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: false
                    }
                }]
            },
            legend: {
                display: false,
            }
        }
    });
</script>

</body>

</html>