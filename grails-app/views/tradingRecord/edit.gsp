<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="page" />
        <g:set var="entityName" value="${message(code: 'tradingRecord.label', default: 'tradingRecord')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        %{--<div class="edit-top"> </div>--}%
    <div class="operation">
        <a class="create-btn back glyphicon glyphicon-arrow-left" title="返回" href="/tradingRecord/list"  > </a>
    </div>
        <div id="edit-stockHistory" class="content scaffold-edit" role="main">
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.tradingRecord}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.tradingRecord}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <form action="/tradingRecord/edit?id=${tradingRecord.id}" method="post">
                <div class="input-group date date-show" data-provide="datepicker" data-date-format="${ConstantUtil.JS_DATE_FORMATE_STR}">
                    <input type="text" class="form-control"
                           value="${tradingRecord && tradingRecord.transactionDate? tradingRecord.transactionDate: new Date().format(ConstantUtil.JAVA_DATE_FORMATE_STR)}"
                           name="transactionDateStr" value="" required="" id="transactionDateStr"  placeholder="交易日期">
                    <div class="input-group-addon">
                        <span class="glyphicon glyphicon-th"></span>
                    </div>
                </div>
                <div class="input-group">
                    <span class="input-group-addon">
                        卖出人
                    </span>
                    <select class="form-control" name="sellUserId">
                        <g:each in="${userList}" var="sellUserVar">
                            <option value="${sellUserVar.id}"
                            <g:if test="${tradingRecord.sellUser.id == sellUserVar.id}">
                            selected = "selected"
                            </g:if>
                            >${sellUserVar.username}</option>
                        </g:each>
                    </select>
                </div>
                <div class="input-group">
                    <span class="input-group-addon">
                        卖出数量
                    </span>
                    <input type="text" name="sellShareNum" value="${tradingRecord?.sellShareNum}" required="" id="sellShareNum" class="form-control" >
                </div>
                <div class="input-group">
                    <span class="input-group-addon">
                        卖出类型
                    </span>
                    <select class="form-control" name="sellType">
                        <option value="1" ${tradingRecord.sellType == 1 ? "selected='selected'" : ""}>股权</option>
                        <option value="2" ${tradingRecord.sellType == 2 ? "selected='selected'" : ""}>期权</option>
                    </select>
                </div>
                <div class="input-group">
                    <span class="input-group-addon">
                        卖出人
                    </span>
                    <select class="form-control" name="buyUserId">
                        <g:each in="${userList}" var="buyUserVar">
                            <option value="${buyUserVar.id}"
                                <g:if test="${tradingRecord.buyUser.id == buyUserVar.id}">
                                selected = "selected"
                                </g:if>
                            >${buyUserVar.username}</option>
                        </g:each>
                    </select>
                </div>
                <div class="input-group">
                    <span class="input-group-addon">
                        买入数量
                    </span>
                    <input type="text" name="buyShareNum" value="${tradingRecord?.buyShareNum}" required="" id="buyShareNum" class="form-control" >
                </div>

                <div class="input-group">
                    <span class="input-group-addon">
                        买卖单价
                    </span>
                    <input type="text" name="tradingPrice" value="${tradingRecord.tradingPrice}" required="" id="tradingPrice" class="form-control" >
                </div>
                <div class="input-group">
                    <span class="input-group-addon">
                        成交金额(元)
                    </span>
                    <input type="text" name="turnover" value="${tradingRecord && tradingRecord.turnover ? tradingRecord.turnover:0}" required="" id="turnover" class="form-control" >
                </div>
                <div class="textArea-group">
                    <span class="input-group-addon">
                        备注
                    </span>
                    <textarea class="form-control" name="remark" id="remark" rows="3">${tradingRecord.remark}</textarea>
                </div>
                <div class="page-new-bottom">
                    <input type="submit" name="create" class="save btn btn-default btn-group-sm" value="保存" id="create" />
                </div>
            </form>
        </div>
    </body>
</html>
