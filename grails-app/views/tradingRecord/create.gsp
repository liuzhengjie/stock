<%@ page import="util.ConstantUtil" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="page" />
        <g:set var="entityName" value="${message(code: 'tradingRecord.label', default: 'TradingRecord')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="tip-container">
        <ul class="nav nav-tabs">
            <li role="presentation" class="active list"><a href="#">交易记录</a></li>
        </ul>
    </div>
    <div class="table-container">
        <g:link class="list create-btn back glyphicon glyphicon-arrow-left" action="list"></g:link>
        <div id="create-stockHistory" class="content scaffold-create" role="main">
            <g:if test="${flash.message}">
                <div class="alert alert-info alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                    ${flash.message}
                </div>
            </g:if>
            <g:hasErrors bean="${this.tradingRecord}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.tradingRecord}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <form action="/tradingRecord/save" method="post">
                <input type="hidden" name="sharePrice" value="${sharePrice}"/>
                <div class="input-group date date-show" data-provide="datepicker" data-date-format="${ConstantUtil.JS_DATE_FORMATE_STR}">
                    <input type="text" class="form-control"
                           value="${tradingRecord && tradingRecord.transactionDate? tradingRecord.transactionDate: new Date().format(ConstantUtil.JS_DATE_FORMATE_STR)}"
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
                            <option value="${sellUserVar.id}" >${sellUserVar.realName}</option>
                        </g:each>
                    </select>
                </div>
                <div class="input-group">
                    <span class="input-group-addon">
                        卖出数量
                    </span>
                    <input type="text" name="sellShareNum" value="${tradingRecord?.sellShareNum}" required="" id="sellShareNum_trading" class="form-control" >
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
                        买入人
                    </span>
                    <select class="form-control" name="buyUserId">
                        <g:each in="${userList}" var="buyUserId">
                            <option value="${buyUserId.id}" >${buyUserId.realName}</option>
                        </g:each>
                    </select>
                </div>
                <div class="input-group">
                    <span class="input-group-addon">
                        买入数量
                    </span>
                    <input type="text" name="buyShareNum" value="${tradingRecord?.buyShareNum}" required="" readonly="readonly" id="buyShareNum_trading" class="form-control" >
                </div>
                <div class="input-group">
                    <span class="input-group-addon">
                        买入类型
                    </span>
                    <select class="form-control" name="buyType">
                        <option value="1" ${tradingRecord.buyType == 1 ? "selected='selected'" : ""}>股权</option>
                        <option value="2" ${tradingRecord.buyType == 2 ? "selected='selected'" : ""}>期权</option>
                    </select>
                </div>
                <div class="input-group">
                    <span class="input-group-addon">
                        买卖单价
                    </span>
                    <input type="text" name="tradingPrice" value="${tradingRecord.tradingPrice}" required="" id="tradingPrice_trading" class="form-control" >
                </div>
                <div class="input-group">
                    <span class="input-group-addon">
                        成交金额(元)
                    </span>
                    <input type="text" name="turnover" value="${tradingRecord && tradingRecord.turnover ? tradingRecord.turnover:0}" required="" readonly="readonly" id="turnover_trading" class="form-control" >
                </div>
                <div class="textArea-group">
                    <span class="input-group-addon">
                        备注
                    </span>
                    <textarea class="form-control" name="remark" id="remark" rows="3"></textarea>
                </div>
                <div class="page-new-bottom">
                    <input type="submit" name="create" class="save btn btn-default btn-group-sm" value="保存" id="create" />
                </div>
            </form>
        </div>
    </div>
    </body>
</html>
