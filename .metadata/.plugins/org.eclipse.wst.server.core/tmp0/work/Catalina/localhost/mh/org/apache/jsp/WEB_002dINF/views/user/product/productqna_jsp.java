/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.56
 * Generated at: 2020-08-28 05:06:18 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.user.product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class productqna_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(5);
    _jspx_dependants.put("/WEB-INF/views/inc/asset.jsp", Long.valueOf(1598578656569L));
    _jspx_dependants.put("jar:file:/C:/Users/user/Documents/GitHub/markethurryserver/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/mhserver/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153352682000L));
    _jspx_dependants.put("/WEB-INF/views/inc/header.jsp", Long.valueOf(1598584311639L));
    _jspx_dependants.put("/WEB-INF/views/inc/footer.jsp", Long.valueOf(1598584618104L));
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1598578656497L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fif_0026_005ftest;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("<!-- Bootstrap -->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"/mh/css/bootstrap.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"/mh/css/markethurry.css\">\r\n");
      out.write("<script src=\"/mh/js/jquery-1.12.4.js\"></script>\r\n");
      out.write("<script src=\"/mh/js/bootstrap.js\"></script>\r\n");
      out.write("<script src=\"/mh/js/Backstretch.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!-- hiding menu -->\r\n");
      out.write("<div id=\"menubartp\">\r\n");
      out.write("\r\n");
      out.write("\t<a href=\"#!\">전체 카테고리</a> \r\n");
      out.write("\t<a href=\"/mh/user/product/hotproduct.do\" class=\"hyperlink\">HOT 상품</a> \r\n");
      out.write("\t<a href=\"/mh/user/product/cheapproduct.do\" class=\"hyperlink\">알뜰 상품</a>\r\n");
      out.write("\t<a href=\"/mh/user/myrecipe/myrecipelist.do\" class=\"hyperlink\">나만의 레시피</a> \r\n");
      out.write("\t<a href=\"/mh/user/event/event.do\" class=\"hyperlink\">이달의 이벤트</a> \r\n");
      out.write("\t<input type=\"text\" id=\"searchbox\" value=\"검색내용을 입력해주세요.\" autocomplete=\"off\"> \r\n");
      out.write("\t<span class=\"glyphicon glyphicon-search\" id=\"searchimg\"></span> \r\n");
      out.write("\t<a href=\"/mh/user/product/shoppingbasket.do\" id=\"shoppingbox\"></a>\r\n");
      out.write("\t<div id=\"detailmenutp\">\r\n");
      out.write("\t\t<ul style=\"list-style: none;\" id=\"detailul\" style=\"z-index:-1;\">\r\n");
      out.write("\t\t\t<li onclick=\"location.href='/mh/user/product/productlist.do?category=0';\">채소</li>\r\n");
      out.write("\t\t\t<li onclick=\"location.href='/mh/user/product/productlist.do?category=1';\">과일</li>\r\n");
      out.write("\t\t\t<li onclick=\"location.href='/mh/user/product/productlist.do?category=2';\">육류</li>\r\n");
      out.write("\t\t\t<li onclick=\"location.href='/mh/user/product/productlist.do?category=3';\">수산</li>\r\n");
      out.write("\t\t\t<li onclick=\"location.href='/mh/user/product/productlist.do?category=4';\">가공식품</li>\r\n");
      out.write("\t\t\t<li onclick=\"location.href='/mh/user/product/productlist.do?category=5';\">양념, 소스</li>\r\n");
      out.write("\t\t\t<li onclick=\"location.href='/mh/user/product/productlist.do?category=6';\">유제품</li>\r\n");
      out.write("\t\t\t<li onclick=\"location.href='/mh/user/product/productlist.do?category=7';\">건강 식품</li>\r\n");
      out.write("\t\t\t<li onclick=\"location.href='/mh/user/product/productlist.do?category=8';\">음료</li>\r\n");
      out.write("\t\t</ul>\r\n");
      out.write("\t</div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!-- user menu (register, login , as) -->\r\n");
      out.write("<div id=\"noticebar\">\r\n");
      out.write("\t<div id=\"noticeMent\">\r\n");
      out.write("\t\t<span class=\"eachNotice\">[마켓허리] \"허리라이프-어디든 간다! 마켓멀리! 신선하지 않은 신선MD의 신선한 장미를 찾아서\" 댓글이벤트 당첨 결과</span> \r\n");
      out.write("\t\t<span class=\"eachNotice\">[마켓허리] 유튜브 ‘컬리라이프-일할 때도 쉴 때도 먹어야 한다, 극한직업 컬리 MD편’ 댓글 이벤트 당첨 공지</span> \r\n");
      out.write("\t\t<span class=\"eachNotice\">[마켓허리] 코로나19 확진자 관련 현황 및 대응조치 안내</span> \r\n");
      out.write("\t\t<span class=\"eachNotice\">[가격인상공지] [모어댄프레쉬] 맥돈 삼겹살 구이용 300g 외 23건 (2020 5. 20 ~)</span> \r\n");
      out.write("\t\t<span class=\"eachNotice\">[마켓허리] 개인정보처리방침 개정 내용 사전안내</span>\r\n");
      out.write("\t</div>\r\n");
      out.write("</div>\r\n");
      out.write("<header>\r\n");
      out.write("\t<div id=\"usermenu\">\r\n");
      out.write("\t\t");
      if (_jspx_meth_c_005fif_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t");
      if (_jspx_meth_c_005fif_005f1(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<!-- 마켓허리 로고 -->\r\n");
      out.write("\t<img src=\"/mh/images/brandlogo.png\" alt=\"brandlogo\" id=\"brandlogo\" style=\"cursor:pointer\"\r\n");
      out.write("\t\tonclick=\"location.href='/mh/user/main/main.do';\">\r\n");
      out.write("</header>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div id=\"menubar\">\r\n");
      out.write("\t<a href=\"#!\">전체 카테고리</a> \r\n");
      out.write("\t<a href=\"/mh/user/product/hotproduct.do\" class=\"hyperlink\">HOT 상품</a> \r\n");
      out.write("\t<a href=\"/mh/user/product/cheapproduct.do\" class=\"hyperlink\">알뜰 상품</a> \r\n");
      out.write("\t<a href=\"/mh/user/myrecipe/myrecipelist.do\" class=\"hyperlink\">나만의 레시피</a> \r\n");
      out.write("\t<a href=\"/mh/user/event/event.do\" class=\"hyperlink\">이달의 이벤트</a> \r\n");
      out.write("\t<input type=\"text\" id=\"searchbox\" value=\"검색내용을 입력해주세요.\" autocomplete=\"off\"> \r\n");
      out.write("\t<span class=\"glyphicon glyphicon-search\" id=\"searchimg\"></span> \r\n");
      out.write("\t<a href=\"/mh/user/product/shoppingbasket.do\" id=\"shoppingbox\"></a>\r\n");
      out.write("\t<div id=\"detailmenu\">\r\n");
      out.write("\t\t<ul style=\"list-style:none;\" id=\"detailul\">\r\n");
      out.write("\t\t\t<li onclick=\"location.href='/mh/user/product/productlist.do?category=0';\">채소</li>\r\n");
      out.write("\t\t\t<li onclick=\"location.href='/mh/user/product/productlist.do?category=1';\">과일</li>\r\n");
      out.write("\t\t\t<li onclick=\"location.href='/mh/user/product/productlist.do?category=2';\">육류</li>\r\n");
      out.write("\t\t\t<li onclick=\"location.href='/mh/user/product/productlist.do?category=3';\">수산</li>\r\n");
      out.write("\t\t\t<li onclick=\"location.href='/mh/user/product/productlist.do?category=4';\">가공식품</li>\r\n");
      out.write("\t\t\t<li onclick=\"location.href='/mh/user/product/productlist.do?category=5';\">양념, 소스</li>\r\n");
      out.write("\t\t\t<li onclick=\"location.href='/mh/user/product/productlist.do?category=6';\">유제품</li>\r\n");
      out.write("\t\t\t<li onclick=\"location.href='/mh/user/product/productlist.do?category=7';\">건강 식품</li>\r\n");
      out.write("\t\t\t<li onclick=\"location.href='/mh/user/product/productlist.do?category=8';\">음료</li>\r\n");
      out.write("\t\t</ul>\r\n");
      out.write("\t</div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" href=\"/mh/css/modal.css\">\r\n");
      out.write("\r\n");
      out.write("<style>\r\n");
      out.write("\r\n");
      out.write("        /*  */\r\n");
      out.write("        #main {\r\n");
      out.write("            width: 1100px;\r\n");
      out.write("            margin: 50px auto;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        hr {\r\n");
      out.write("            border: 2px solid #eee;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        #tblQna th, #tblQna td {\r\n");
      out.write("            font-size: 14px;\r\n");
      out.write("            text-align: center;\r\n");
      out.write("            height: 30px;\r\n");
      out.write("        }\r\n");
      out.write(" \r\n");
      out.write("        #tblQna tbody tr:first-child th, #tblQna tbody tr:first-child td{\r\n");
      out.write("            border-top: 2px solid #08718E;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        #btnAddQna {\r\n");
      out.write("            border-style: none;\r\n");
      out.write("            background-color: #08718E;\r\n");
      out.write("            border-radius: 3px;\r\n");
      out.write("            color: white;\r\n");
      out.write("            font-size:15px;\r\n");
      out.write("            height: 40px;\r\n");
      out.write("            width: 100px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        #btnCancelQna {\r\n");
      out.write("            border-style: none;\r\n");
      out.write("            background-color: #eee;\r\n");
      out.write("            border-radius: 3px;\r\n");
      out.write("            /* color:  #337ab7; */\r\n");
      out.write("            font-size:15px;\r\n");
      out.write("            height: 40px;\r\n");
      out.write("            width: 100px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("    </style>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div id=\"main\">\r\n");
      out.write("        <h3>상품 문의</h3>\r\n");
      out.write("\r\n");
      out.write("        <!-- 상단 문의 안내사항 -->\r\n");
      out.write("        <ul id=\"header\">\r\n");
      out.write("            <li>\r\n");
      out.write("                상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.\r\n");
      out.write("            </li>\r\n");
      out.write("            <li>\r\n");
      out.write("                배송관련, 주문(취소/교환/환불)관련 문의 및 요청 사항은 마이페이지 내 1:1 문의에 남겨주세요.\r\n");
      out.write("            </li>\r\n");
      out.write("        </ul>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <!-- id값 바꾸기, 상품에 상품명들어가게 -->\r\n");
      out.write("        <!-- 상품 문의 테이블 -->\r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("        <form method=\"POST\" action=\"/mh/user/product/productqnaok.do\">\r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("        <table id=\"tblQna\" class=\"table table-bordered\" style=\"width: 1100px; margin-top: 20px;\">\r\n");
      out.write("        \r\n");
      out.write("        \t\r\n");
      out.write("            <tr>\r\n");
      out.write("                <th style=\"width: 30%;\">상품</th>\r\n");
      out.write("                <td style=\"width: 70%; text-align: left;\">\r\n");
      out.write("                    <span>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pdto.name}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</span>\r\n");
      out.write("                    <input type=\"hidden\" name=\"pseq\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pdto.seq}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\">\r\n");
      out.write("                </td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            <tr>\r\n");
      out.write("                <th style=\"width: 30%;\">제목</th>\r\n");
      out.write("                <td style=\"width: 70%\">\r\n");
      out.write("                    <input type=\"text\" class=\"form-control\" id=\"tblTitle\" name=\"title\" style=\"height: 100%;\" required>\r\n");
      out.write("                </td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            \r\n");
      out.write("            <tr>\r\n");
      out.write("                <th style=\"width: 30%; height:455px;\">내용</th>\r\n");
      out.write("                <td style=\"width: 70%\">\r\n");
      out.write("                    <div class=\"divContent\" style=\"height: 100%;\">\r\n");
      out.write("                    <!-- <input type=\"text\" class=\"form-control\" style=\"height: 300px;\"> -->\r\n");
      out.write("                    <textarea class=\"form-control\" id=\"tblContent\" name=\"content\" style=\"height: 100%;\" required>\r\n");
      out.write("상품문의 작성 전 확인해주세요!!\r\n");
      out.write("\r\n");
      out.write("답변은 영업일 기준 2~3일 소요됩니다.\r\n");
      out.write("해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.\r\n");
      out.write("배송관련, 주문(취소/교환/환불)관련 문의 및 요청 사항은 마이페이지 내 1:1 문의에 남겨주세요.\r\n");
      out.write("    \r\n");
      out.write("- 제품\r\n");
      out.write("제품 상세정보는 상세 이미지 또는 상세정보에서 확인 가능합니다.\r\n");
      out.write("\r\n");
      out.write("- 주문취소\r\n");
      out.write("입금 전 단계에서는 직접 취소 가능\r\n");
      out.write("상품 준비중 단계 이후에는 취소가 제한됩니다.\r\n");
      out.write("일부 예약 상품은 배송 3~4일 전에만 취소 가능합니다.\r\n");
      out.write("주문상품의 부분 취소는 불가능합니다. 전체 주문 취소 후 재구매 해주세요.\r\n");
      out.write("\r\n");
      out.write("- 배송\r\n");
      out.write("배송일 및 배송시간 지정은 불가능합니다. (예약배송 포함)\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("※ 상세 개인정보가 문의 내용에 저장되지 않도록 주의해 주시기 바랍니다.\r\n");
      out.write("                    </textarea>\r\n");
      out.write("                </div>\r\n");
      out.write("                </td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            <tr>\r\n");
      out.write("                <th style=\"width: 30%;\">첨부 사진</th>\r\n");
      out.write("                <td style=\"text-align: left;\">\r\n");
      out.write("                    <!-- 이미지 파일만 선택가능 -->\r\n");
      out.write("                    <input type=\"file\" style=\"display: inline;\" name=\"img\" accept=\"image/*\"> \r\n");
      out.write("                </td>\r\n");
      out.write("            </tr>\r\n");
      out.write("        </table>\r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("\r\n");
      out.write("        <div style=\"text-align: center; margin-top: 50px\">\r\n");
      out.write("            <input type=\"button\" id=\"btnCancelQna\" value=\"작성 취소\" style=\"margin-right: 20px;\">\r\n");
      out.write("            <button type=\"submit\" id=\"btnAddQna\">작성 완료</button>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("\t\t</form>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("    \r\n");
      out.write("    <div id=\"modal\"></div>\r\n");
      out.write("    \r\n");
      out.write("    <!--문의등록 완료-->\r\n");
      out.write("    <div class=\"modal_common productqnasuccess\">\r\n");
      out.write("        <a href=\"javascript:;\" class=\"close\">X</a>\r\n");
      out.write("        <p class=\"title\">알림메세지</p>\r\n");
      out.write("        <div class=\"con\">문의등록 완료</div>\r\n");
      out.write("        <div><input type=\"button\" value=\"확인\" href=\"javascript:;\" class=\"yes\"></div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div style=\"clear: both;\"></div>\r\n");
      out.write("<!-- footer -->\r\n");
      out.write("\r\n");
      out.write(" <!-- top button -->\r\n");
      out.write("    <a href=\"#\" id=\"topbtn\" style=\"border: 0px; outline: none;\"></a>\r\n");
      out.write("\r\n");
      out.write("    <!-- footer -->\r\n");
      out.write("    <div id=\"footer\">\r\n");
      out.write("        <div id=\"innerfooter\">\r\n");
      out.write("            <div class=\"footerctnt\">\r\n");
      out.write("                <table id=\"ft1\" style=\"outline: none;\">\r\n");
      out.write("                    <tbody>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td>\r\n");
      out.write("                            <span style=\"display:block; font-size:24px;\">고객센터</span>\r\n");
      out.write("                        </td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td><span id=\"asknum\">1600-4000</span></td>\r\n");
      out.write("                        <td><span>365 고객센터</span><br><span class=\"cpmdesc\">오전 7시 - 오후 7시</span></td>\r\n");
      out.write("                        \r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td><a href=\"/mh/user/customercenter/onebyone.do\" class=\"ask\">1:1 문의</a></td>\r\n");
      out.write("                        <td><span>24시간 접수 가능</span><br><span class=\"cpmdesc\">고객센터 운영중 순차적으로 답변해드리겠습니다.</span></td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td><a href=\"/mh/admin/main/adminlogin.do\" class=\"ask\">관리자</a></td>\r\n");
      out.write("                        <td><span style=\"font-weight: bold; font-size:15px\"></span></td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                </tbody>\r\n");
      out.write("                </table>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"footerctnt\">\r\n");
      out.write("                <table id=\"ft2\" style=\"outline: none;\">\r\n");
      out.write("                    <tbody>\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <a href=\"\">회사소개</a>\r\n");
      out.write("                                <a href=\"\">인재채용</a>\r\n");
      out.write("                                <a href=\"\">이용약관</a>\r\n");
      out.write("                                <a href=\"\">개인정보처리방침</a>\r\n");
      out.write("                                <a href=\"\">이용안내</a>\r\n");
      out.write("                            </td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td><span class=\"cpmdesc\">법인명 (상호): 주식회사 MarketHurry &nbsp;|&nbsp; \r\n");
      out.write("                                사업자등록번호: 123-45-7891011</span><br>\r\n");
      out.write("                                <span class=\"cpmdesc\">통신판매업: 제 2018-서울역삼-0123425호 &nbsp;|&nbsp; 개인정보보호책임자: (주)마켓허리</span><br>\r\n");
      out.write("                                <span class=\"cpmdesc\">주소: 서울 강남구 테헤란로 132 (역삼동)한독약품 빌딩 8층 &nbsp;|&nbsp; 대표이사: 이은수</span><br>\r\n");
      out.write("                                <span class=\"cpmdesc\" >제휴문의 : <span style=\"color:#08718E;\">markethurry@hurrycorp.com</span></span><br>\r\n");
      out.write("                                <span class=\"cpmdesc\">채용문의 : <span style=\"color:#08718E;\">recruit@hurrycorp.com</span></span><br>\r\n");
      out.write("\r\n");
      out.write("                                <span class=\"cpmdesc\">팩스: 070-1234-5678 &nbsp;|&nbsp; 이메일: <span style=\"color:#08718E;\">help@hurrycorp.com</span></span><br><br>\r\n");
      out.write("                                <span class=\"cpmdesc\">© HURRY CORP. ALL RIGHTS RESERVED</span>\r\n");
      out.write("                            </td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <a id=\"insta\" class=\"snslogo\"></a>\r\n");
      out.write("                                <a id=\"fb\" class=\"snslogo\"></a>\r\n");
      out.write("                                <a id=\"post\" class=\"snslogo\"></a>\r\n");
      out.write("                                <a id=\"blog\" class=\"snslogo\"></a>\r\n");
      out.write("                            </td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    </tbody>\r\n");
      out.write("                </table>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("        \r\n");
      out.write("        // 하이퍼링크 마우스 올리면 색 변화 (색은 나중에 변경)\r\n");
      out.write("        $(\".hyperlink\").mouseover(function(){\r\n");
      out.write("            // $(this).css(\"color\",\"red\"); // 색 변경 필요\r\n");
      out.write("        })\r\n");
      out.write("\r\n");
      out.write("        $(\".hyperlink\").mouseout(function(){\r\n");
      out.write("            $(this).css(\"color\",\"black\"); // 색 변경 필요\r\n");
      out.write("        })\r\n");
      out.write("\r\n");
      out.write("        // $(\"#menubar[0]\").css(\"color\",\"red\");\r\n");
      out.write("        //$(\"#menubar > a\").first().hide();\r\n");
      out.write("        //console.log($(\"#menubar > a\").first);\r\n");
      out.write("\r\n");
      out.write("        $(\"#menubar > a\").first().mouseenter(function(event){\r\n");
      out.write("            console.log(\"click\");\r\n");
      out.write("\r\n");
      out.write("        });\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        // 로고 클릭시 메인화면으로\r\n");
      out.write("        $(\"#brandlogo\").click(function() {\r\n");
      out.write("            $(location).attr('href', '/mh/user/main/main.do');\r\n");
      out.write("        });\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        \r\n");
      out.write("        // 텍스트 박스 포커스 가면 내용 사라짐\r\n");
      out.write("        $(\"#tblContent\").focus(function() { \r\n");
      out.write("            $(this).val(\"\");\r\n");
      out.write("            $(\".divContent\").attr('class', 'emContent');  \r\n");
      out.write("            \r\n");
      out.write("        });\r\n");
      out.write("\r\n");
      out.write("        // 내용 입력하면 ok로 변경(등록 가능한 상태)\r\n");
      out.write("        $(\"#tblContent\").on(\"input\", function() {\r\n");
      out.write("            $(\".emContent\").attr('class', 'okContent');\r\n");
      out.write("        });\r\n");
      out.write("            \r\n");
      out.write("      \r\n");
      out.write("\r\n");
      out.write("        // 작성 취소 - 상품상세 페이지로 이동\r\n");
      out.write("        $(\"#btnCancelQna\").click(function() {\r\n");
      out.write("        \thistory.back();\r\n");
      out.write("            /* $(location).attr('href', 'history.back();'); */\r\n");
      out.write("        });\r\n");
      out.write("\r\n");
      out.write("        //작성 완료\r\n");
      out.write("         $(\"#btnAddQna\").click(function() {\r\n");
      out.write("            // 위의 항목을 다 채웠는지 검사해야함\r\n");
      out.write("            if ($(\"#tblTitle\").val() == \"\") {\r\n");
      out.write("                alert(\"제목을 입력하세요!\");\r\n");
      out.write("            } else if (!($(\"#tblContent\").parent().hasClass('okContent'))) {\r\n");
      out.write("                alert(\"내용을 입력하세요!\");\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            //상품상세의 상품문의에 추가되게끔\r\n");
      out.write("        }); \r\n");
      out.write("\r\n");
      out.write("  \r\n");
      out.write("        \r\n");
      out.write("\r\n");
      out.write("    </script>\r\n");
      out.write("    <script src=\"/mh/js/main.js\"></script>\r\n");
      out.write("    <script src=\"/mh/js/modal.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005fif_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    boolean _jspx_th_c_005fif_005f0_reused = false;
    try {
      _jspx_th_c_005fif_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f0.setParent(null);
      // /WEB-INF/views/inc/header.jsp(45,2) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${empty sessionScope.seq }", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
      if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("\t\t\t<a href=\"/mh/user/main/register.do\" class=\"hyperlink\">회원가입</a>\r\n");
          out.write("\t\t\t<a href=\"/mh/user/main/login.do\" class=\"hyperlink\">로그인</a>\r\n");
          out.write("\t\t\t<a href=\"/mh/user/customercenter/customercenter.do\" class=\"hyperlink\">고객센터</a>\r\n");
          out.write("\t\t");
          int evalDoAfterBody = _jspx_th_c_005fif_005f0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
      _jspx_th_c_005fif_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fif_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fif_005f0_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f1(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f1 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    boolean _jspx_th_c_005fif_005f1_reused = false;
    try {
      _jspx_th_c_005fif_005f1.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f1.setParent(null);
      // /WEB-INF/views/inc/header.jsp(51,2) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f1.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${not empty sessionScope.seq }", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_005fif_005f1 = _jspx_th_c_005fif_005f1.doStartTag();
      if (_jspx_eval_c_005fif_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("\t\t\t<a href=\"/mh/user/main/loginout.do\" class=\"hyperlink\">로그아웃</a>\r\n");
          out.write("\t\t\t<a href=\"/mh/user/mypage/orderlist.do\" class=\"hyperlink\">마이페이지</a>\r\n");
          out.write("\t\t\t<a href=\"/mh/user/customercenter/customercenter.do\" class=\"hyperlink\">고객센터</a>\r\n");
          out.write("\t\t");
          int evalDoAfterBody = _jspx_th_c_005fif_005f1.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f1);
      _jspx_th_c_005fif_005f1_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fif_005f1, _jsp_getInstanceManager(), _jspx_th_c_005fif_005f1_reused);
    }
    return false;
  }
}
