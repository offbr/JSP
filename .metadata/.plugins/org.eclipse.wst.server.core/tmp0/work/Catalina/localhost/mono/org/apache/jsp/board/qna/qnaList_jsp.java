/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.36
 * Generated at: 2016-10-11 14:17:52 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.board.qna;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.HashMap;
import java.util.Map;
import board.business.QnaBean;
import java.util.ArrayList;

public final class qnaList_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(4);
    _jspx_dependants.put("/board/qna/../../header.jsp", Long.valueOf(1474106208000L));
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1473405622000L));
    _jspx_dependants.put("jar:file:/Users/All/Documents/work/workspace/websou/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/mono/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153352682000L));
    _jspx_dependants.put("/board/qna/../../footer.jsp", Long.valueOf(1475225419000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("board.business.QnaBean");
    _jspx_imports_classes.add("java.util.Map");
    _jspx_imports_classes.add("java.util.HashMap");
    _jspx_imports_classes.add("java.util.ArrayList");
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems;
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
    _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.release();
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

final java.lang.String _jspx_method = request.getMethod();
if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      mono.mybatis.ProcessDao processDao = null;
      processDao = (mono.mybatis.ProcessDao) _jspx_page_context.getAttribute("processDao", javax.servlet.jsp.PageContext.PAGE_SCOPE);
      if (processDao == null){
        processDao = new mono.mybatis.ProcessDao();
        _jspx_page_context.setAttribute("processDao", processDao, javax.servlet.jsp.PageContext.PAGE_SCOPE);
      }
      out.write('\n');
 

int pageNum = 1; //하단 페이지 수
int pageList = 10; //1페이지에 보여질 게시글 수
int b_pageList = 10; //1블럭에 보여질 페이지 수;
int block = 1; //블럭 수

// 하단 페이지수
try{
	 pageNum = Integer.parseInt(request.getParameter("page"));
}catch(Exception e){
	pageNum = 1; //parameter page값이 제대로 안들어오면 1;
}
if(pageNum <= 0) pageNum = 1; //parameter page값 이상한값 들어오면 1;
// /하단 페이지수

// 게시글수
try{
	pageList = Integer.parseInt(request.getParameter("pageList"));
}catch(Exception e){
	pageList = 10; //parameter pageList값이 제대로 안들어오면 1;
}
if(pageList <= 0) pageList = 1; //parameter pageList값 이상한값 들어오면 1;
// /게시글수

// 블럭수
try{
	block = Integer.parseInt(request.getParameter("block"));
}catch(Exception e){
	block = 1; //parameter pageList값이 제대로 안들어오면 1;
}
if(block <= 0) block = 1; //parameter pageList값 이상한값 들어오면 1;
// //블럭수

block = (int)Math.ceil((double)pageNum/b_pageList); // 계산된 블럭수

int b_start_page = ((block-1) * b_pageList) + 1; //현재 블럭에서 시작 페이지 번호;
int b_end_page = b_start_page + b_pageList - 1; //현재 블럭에서 마지막 페이지 번호;

int totalPage = (int)Math.ceil((double)processDao.qnaCount()/pageList); //총 페이지 = 게시글의 총갯수 / 1뷰에 보여질 게시글 수;
if (b_end_page > totalPage) b_end_page = totalPage; //총 페이지수가 15인데 블럭 2개 만들어지면 마지막 페이지가 20이므로 공백 페이지가 생겼을때 처리;

int totalBlock = (int)Math.ceil((double)totalPage/b_pageList); //총 블럭수 = 총 페이지 갯수 / 블럭에 나타날 페이지 수

//DB limit (db는 시작페이지가 0);
int pageChoice = (pageNum - 1) * pageList; //

      out.write('\n');
      out.write('\n');

//검색이 있는 경우
String stype = request.getParameter("stype");
String sword = request.getParameter("sword");

Map<String, String> mapSerach = new HashMap<String, String>();

mapSerach.put("stype", stype);
mapSerach.put("sword", sword);

      out.write('\n');
      out.write('\n');
 
ArrayList<QnaBean> list = null;
if(sword == null) 
	list = (ArrayList)processDao.qnaList(pageChoice); //검색이 없을 경우
else
	list = (ArrayList)processDao.qnaSearch(mapSerach); //검색이 있을 경우

      out.write('\n');
      out.write('\n');
      out.write('\n');
 String m_email = (String)session.getAttribute("email_key"); // 세션값으로 자기글 읽기 
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->\n");
      out.write("<title>mono</title>\n");
      out.write("\n");
      out.write("<!-- 합쳐지고 최소화된 최신 CSS -->\n");
      out.write("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("\n");
      out.write("<!-- 부가적인 테마 -->\n");
      out.write("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css\">\n");
      out.write("\n");
      out.write("<!-- 글꼴 -->\n");
      out.write("<link href=\"https://fonts.googleapis.com/css?family=Montserrat\" rel=\"stylesheet\">\n");
      out.write("<link href=\"https://fonts.googleapis.com/css?family=Abel\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("<!-- 합쳐지고 최소화된 최신 자바스크립트 -->\n");
      out.write("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js\"></script>\n");
      out.write("<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.js\"></script>\n");
      out.write("\n");
      out.write("<!-- 메인 메뉴바 가운데 정렬 -->\n");
      out.write("<style>\n");
      out.write("table {\n");
      out.write("\tfont-family: 'Abel', sans-serif;\n");
      out.write("}\n");
      out.write(".example .pagination>li>a,\n");
      out.write(".example .pagination>li>span {\n");
      out.write("  \tcolor: black;\n");
      out.write("}\n");
      out.write(".pagination>li.active>a {\n");
      out.write("\tborder-color: #ddd;\n");
      out.write("  \tbackground: #949494;\n");
      out.write("  \tcolor: black;\n");
      out.write("}\n");
      out.write("</style>\n");
      out.write("\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("function getPassword(b_no) {\n");
      out.write("\tvar f = document.qnaPwdFrm;\n");
      out.write("\tf.b_no.value = b_no;\n");
      out.write("\t$('#b_pass').focus();\n");
      out.write("\t$('#myModal').modal('show');\t\n");
      out.write("}\n");
      out.write("\n");
      out.write("function checkPwdFrm() {\n");
      out.write("\tvar f = document.qnaPwdFrm;\n");
      out.write("\tif (f.b_pass.value == \"\") {\n");
      out.write("\t\talert(\"비밀번호를 입력해 주세요.\");\n");
      out.write("\t\tf.b_pass.focus();\n");
      out.write("\t\treturn;\n");
      out.write("\t}\n");
      out.write("\tf.submit();\n");
      out.write("}\n");
      out.write("\n");
      out.write("function closePwd() {\n");
      out.write("\t$('#myModal').modal('hide');\n");
      out.write("}\n");
      out.write("\n");
      out.write("function serach(){\n");
      out.write("\tif(document.searchFrm.sword.value == \"\"){\n");
      out.write("\t\tdocument.searchFrm.sword.focus();\n");
      out.write("\t\talert(\"검색어를 입력하세요!\");\n");
      out.write("\t\treturn;\n");
      out.write("\t}\n");
      out.write("\tdocument.searchFrm.submit();\n");
      out.write("}\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("<div class=\"container\">\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("<!-- header -->\n");
      out.write("\n");
      out.write("<!-- 메인 메뉴바 가운데 정렬 -->\n");
      out.write("<style>\n");
      out.write(".nav-tabs>li, .nav-pills>li {\n");
      out.write("\tfloat: none;\n");
      out.write("\tdisplay: inline-block;\n");
      out.write("}\n");
      out.write(".nav-tabs, .nav-pills {\n");
      out.write("\ttext-align: center;\n");
      out.write("}\n");
      out.write("body {\n");
      out.write("\tfont-family: 'Montserrat', sans-serif;\n");
      out.write("}\n");
      out.write("a{\n");
      out.write(" color: #454545;\n");
      out.write("}\n");
      out.write("</style>    \n");
      out.write("    \n");
      out.write("<!-- 상단 아이콘 -->\n");
      out.write("<article>\n");
      out.write("<div class=\"container-fluid\">\n");
      out.write("\t<div class=\"pull-right\">\n");
      out.write("\t\t<br>\n");
      out.write("\t\t<a href=\"http://localhost:8080/mono/index.jsp\"><span class=\"glyphicon glyphicon-home\" aria-hidden=\"true\"></span></a>&nbsp;\n");
      out.write("\t\t<a href=\"#\"><span class=\"glyphicon glyphicon-search\" aria-hidden=\"true\"></span></a>&nbsp;\n");
      out.write("\t\t<a href=\"../../shop/cart/cart.jsp\"><span class=\"glyphicon glyphicon-shopping-cart\" aria-hidden=\"true\"></span></a>\n");
      out.write("\t</div>\n");
      out.write("</div>\n");
      out.write("</article>\n");
      out.write("<!-- //상단 아이콘 -->\n");
      out.write("\n");
      out.write("<br><br>\n");
      out.write("\n");
      out.write("<!-- 메인이미지 -->\n");
      out.write("<div class=\"container\">\n");
      out.write("\t <!-- 가운데 정렬 center-block 크기를 지정해줘야한다 -->\n");
      out.write("\t<a href=\"http://localhost:8080/mono/index.jsp\"><img src=\"../../images/logo.png\" class=\"img-responsive center-block\" alt=\"Responsive image\"></a>\n");
      out.write("</div>\n");
      out.write("<!-- //메인이미지 -->\n");
      out.write("\n");
      out.write("<br><br>\n");
      out.write("\n");
      out.write("<!-- 메인메뉴 -->\n");
      out.write("<div class=\"container\">\n");
      out.write("  <ul class=\"nav nav-tabs\" style=\"border-top: solid 1px; border-top-color: #dddddd;\">\n");
      out.write("    <li><a href=\"../../index.jsp\">HOME</a></li>\n");
      out.write("    <li><a href=\"../../shop/deck/deck.jsp\">SHOP</a></li>\n");
      out.write("    <li><a href=\"../../board/qna/qnaList.jsp\">Q&A</a></li>\n");
      out.write("    <li><a href=\"../../mypage/index/mypageindex.jsp\">MYPAGE</a></li>\n");
      out.write("  </ul>\n");
      out.write("</div>\n");
      out.write("<!-- //메인메뉴 -->\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- //header -->\n");
      out.write("<br>\n");
      out.write("\n");
      out.write("<!-- 검색창 -->\n");
      out.write("<div class=\"container text-right\">\n");
      out.write("\n");
      out.write("<form action=\"qnaList.jsp\" name=\"searchFrm\" method=\"post\" class=\"form-inline\">\n");
      out.write("\t<div class=\"form-group\">\n");
      out.write("\t\n");
      out.write("\t<select name=\"stype\" class=\"form-control input-sm\">\n");
      out.write("\t\t<option value=\"b_title\" selected=\"selected\">글제목</option>\n");
      out.write("\t\t<option value=\"b_name\">글작성자</option>\n");
      out.write("\t</select>\n");
      out.write("\t<input type=\"text\" name=\"sword\" placeholder=\"검색어를 입력하세요\" class=\"form-control input-sm\">\n");
      out.write("\t<a href=\"javascript:serach();\"><span class=\"glyphicon glyphicon-search\" aria-hidden=\"true\"></span></a>&nbsp;&nbsp;\n");
      out.write("\t<a href=\"qnaWrite.jsp\"><span class=\"glyphicon glyphicon-pencil\" aria-hidden=\"true\"></span></a>  \n");
      out.write("\t</div>\n");
      out.write("</form>\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("<!-- //검색창 -->\n");
      out.write("\n");
      out.write("<br>\n");
      out.write("\n");
      out.write("<!-- 게시판리스트 -->\n");
      out.write("<div class=\"container\">\n");
      out.write("<div class=\"panel panel-default\">\n");
      out.write("\n");
      out.write("  <!-- Table -->\n");
      out.write(" \t<table class=\"table\" border=\"1\">\n");
      out.write("  \t\t<tr style=\"font-weight: bold;\">\n");
      out.write("    \t\t<th style=\"width: 100px\">NO</th><th>SUBJECT</th><th style=\"width: 150px\">NAME</th><th style=\"width: 150px\">DATE</th>\n");
      out.write("   \t\t</tr>\n");
      out.write("\t");
      //  c:forEach
      org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_005fforEach_005f0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
      _jspx_th_c_005fforEach_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fforEach_005f0.setParent(null);
      // /board/qna/qnaList.jsp(188,1) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fforEach_005f0.setVar("q");
      // /board/qna/qnaList.jsp(188,1) name = items type = javax.el.ValueExpression reqTime = true required = false fragment = false deferredValue = true expectedTypeName = java.lang.Object deferredMethod = false methodSignature = null
      _jspx_th_c_005fforEach_005f0.setItems(list);
      int[] _jspx_push_body_count_c_005fforEach_005f0 = new int[] { 0 };
      try {
        int _jspx_eval_c_005fforEach_005f0 = _jspx_th_c_005fforEach_005f0.doStartTag();
        if (_jspx_eval_c_005fforEach_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
          do {
            out.write("\n");
            out.write("   \t\t<tr style=\"color: #949494;\">\n");
            out.write("   \t\t\t<td>");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${q.b_no}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("</td>\n");
            out.write("   \t\t\t<td>\n");
            out.write("   \t\t\t<a href= \"javascript:getPassword('");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${q.b_no}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("')\">");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${q.b_title}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("</a> <img src=\"../../images/icon_lock.gif\" alt=\"Q\">\n");
            out.write("   \t\t\t");
            if (_jspx_meth_c_005fif_005f0(_jspx_th_c_005fforEach_005f0, _jspx_page_context, _jspx_push_body_count_c_005fforEach_005f0))
              return;
            out.write("\n");
            out.write("   \t\t\t</td>\n");
            out.write("   \t\t\t<td>");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${q.b_name}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("</td>\n");
            out.write("   \t\t\t<td>");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${q.b_date}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("</td>\n");
            out.write("   \t\t</tr>\n");
            out.write("   \t");
            int evalDoAfterBody = _jspx_th_c_005fforEach_005f0.doAfterBody();
            if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
              break;
          } while (true);
        }
        if (_jspx_th_c_005fforEach_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
          return;
        }
      } catch (java.lang.Throwable _jspx_exception) {
        while (_jspx_push_body_count_c_005fforEach_005f0[0]-- > 0)
          out = _jspx_page_context.popBody();
        _jspx_th_c_005fforEach_005f0.doCatch(_jspx_exception);
      } finally {
        _jspx_th_c_005fforEach_005f0.doFinally();
        _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.reuse(_jspx_th_c_005fforEach_005f0);
      }
      out.write("\n");
      out.write("   \t\n");
      out.write("\t</table>\n");
      out.write("  <!-- //table -->\n");
      out.write("  \n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("<!-- //게시판리스트 -->\n");
      out.write("\n");
      out.write("\n");
      out.write("<div class=\"container text-center\">\n");
      out.write("<div class=\"example\">\n");
      out.write("<nav>\n");
      out.write("\t<ul class=\"pagination pagination-sm\">\n");
      out.write("\t\n");
      out.write("\t\t<!-- 첫페이지로 가기 -->\n");
      out.write("\t\t\t");
 
		if(pageNum <= 1){  // 페이지번호가 1보다 작거나 같다면 클릭x 
		
      out.write("\n");
      out.write("\t\t<li class=\"disabled\"><a href=\"#\">First</a></li>\n");
      out.write("\t\t");
 
		}else{ // 1보다 크면 클릭o
		
      out.write("\n");
      out.write("\t\t<li><a href=\"qnaList.jsp?page=&pageList=");
      out.print(pageList);
      out.write("\">First</a></li>\n");
      out.write("\t\t");
 
		}
		
      out.write("\n");
      out.write("\t\t<!-- //첫페이지로 가기 -->\n");
      out.write("\t\t\n");
      out.write("\t\t<!-- 이전 10개 -->\t\n");
      out.write("\t\t");

		if(block <= 1){ // 블럭이 1보다 작거나 같다면 클릭x
		
      out.write("\n");
      out.write("\t\t<li class=\"disabled\"><a href=\"#\" aria-label=\"Previous\"> <span aria-hidden=\"true\">&laquo;</span></a></li>\n");
      out.write("\t\t");

		}else{ //  1보다 크면 클릭o
		
      out.write("\n");
      out.write("\t\t<li><a href=\"qnaList.jsp?page=");
      out.print(b_start_page - 1);
      out.write("&pageList=");
      out.print(pageList);
      out.write("\" aria-label=\"Previous\"> <span aria-hidden=\"true\">&laquo;</span></a></li>\n");
      out.write("\t\t");

		}
		
      out.write("\n");
      out.write("\t\t<!-- //이전 10개 -->\n");
      out.write("\t\t\n");
      out.write("\t\t<!-- 페이지 리스트 -->\n");
      out.write("\t\t");

		for(int i = b_start_page; i <= b_end_page; i++){ //시작페이지부터 마지막페이지까지 반복문
			if(pageNum == i){ // 현재페이지와 i가 같으면 클릭 x
				
      out.write("\n");
      out.write("\t\t\t\t<li class=\"active\"><a href=\"#\">");
      out.print(i);
      out.write("</a></li>\n");
      out.write("\t\t\t\t");

			}else{
				
      out.write("\n");
      out.write("\t\t\t\t<li><a href=\"qnaList.jsp?page=");
      out.print(i);
      out.write("&pageList=");
      out.print(pageList);
      out.write('"');
      out.write('>');
      out.print(i);
      out.write("</a></li>\n");
      out.write("\t\t\t\t");

			}
		}
		
      out.write("\n");
      out.write("\t\t<!-- //페이지 리스트 -->\n");
      out.write("\t\t\n");
      out.write("\t\t<!-- 다음 10개 -->\n");
      out.write("\t\t");

		if(block >= totalBlock){ //현재 블럭과 총 블럭갯수가 같으면 클릭x
		
      out.write("\n");
      out.write("\t\t<li class=\"disabled\"><a href=\"#\" aria-label=\"Next\"> <span aria-hidden=\"true\">&raquo;</span></a></li>\n");
      out.write("\t\t");

		}else{
		
      out.write("\n");
      out.write("\t\t<li><a href=\"qnaList.jsp?page=");
      out.print(b_end_page + 1);
      out.write("&pageList=");
      out.print(pageList);
      out.write("\" aria-label=\"Next\"> <span aria-hidden=\"true\">&raquo;</span></a></li>\n");
      out.write("\t\t");
	
		}
		
      out.write("\n");
      out.write("\t\t<!-- //다음 10개 -->\n");
      out.write("\t\t\n");
      out.write("\t\t<!-- 마지막페이지 -->\n");
      out.write("\t\t");

		if(pageNum >= totalPage){ //현재페이지의 수와 총페이지수가 같다면 클릭x
		
      out.write("\n");
      out.write("\t\t<li class=\"disabled\"><a href=\"#\">Last</a></li>\n");
      out.write("\t\t");
	
		}else{
		
      out.write("\n");
      out.write("\t\t<li><a href=\"qnaList.jsp?page=");
      out.print(totalPage);
      out.write("&pageList=");
      out.print(pageList);
      out.write("\">Last</a></li>\n");
      out.write("\t\t");

		}
		
      out.write("\n");
      out.write("\t\t<!-- //마지막페이지 -->\n");
      out.write("\t</ul>\n");
      out.write("\n");
      out.write("</nav>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<!-- 비밀번호 폼 -->\n");
      out.write("<!-- Modal -->\n");
      out.write("<div class=\"modal fade bs-example-modal-sm\" id=\"myModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"mySmallModalLabel\" aria-hidden=\"true\">\n");
      out.write("  <div class=\"modal-dialog modal-sm\">\n");
      out.write("    <div class=\"modal-content\">\n");
      out.write("\n");
      out.write("<div class=\"form-group text-center\">\n");
      out.write("<form name=\"qnaPwdFrm\" id=\"qnaPwdFrm\"  method=\"post\" action=\"qnaView.jsp\" class=\"form-inline\">\n");
      out.write("\t<input type=\"hidden\" name=\"b_no\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${b_no}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\" /> \n");
      out.write("\t<input type=\"hidden\" name=\"pageNum\" value=\"");
      out.print(pageNum);
      out.write("\" /> \n");
      out.write("\t<input type=\"hidden\" name=\"pageList\" value=\"");
      out.print(pageList);
      out.write("\" />\n");
      out.write("\t<input type=\"hidden\" name=\"b_state\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${b_state}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\" />\n");
      out.write("\t<div class=\"modal-body\">\n");
      out.write("\t\t<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>\n");
      out.write("\t\t<h4 class=\"modal-title\" id=\"gridSystemModalLabel\">비밀번호</h4>\n");
      out.write("\t\t<label for=\"recipient-name\" class=\"control-label\">해당 게시글의 비밀번호를 입력해주세요</label>\n");
      out.write("            <input type=\"password\" maxlength=\"20\" name=\"b_pass\" id=\"b_pass\" class=\"form-control input-sm\" id=\"recipient-name\">\n");
      out.write("        <div class=\"btn-group btn-group-sm\" role=\"group\" aria-label=\"...\">\n");
      out.write("        \t<button type=\"button\" onclick=\"javascript:closePwd();\" class=\"btn btn-default\" data-dismiss=\"modal\">Close</button>\n");
      out.write("        \t<button type=\"button\" onclick=\"javascript:checkPwdFrm();\" class=\"btn btn-default\">OK</button>\n");
      out.write("\t\t</div>\n");
      out.write("\t</div>\n");
      out.write("</form>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("   </div><!-- /.modal-content -->\n");
      out.write("  </div><!-- /.modal-dialog -->\n");
      out.write("</div><!-- /.modal -->\n");
      out.write("<!-- //비밀번호 폼 -->\n");
      out.write("\n");
      out.write("\n");
      out.write("<br><br>\n");
      out.write("<!-- footer -->\n");
      out.write("\n");
      out.write("<link href=\"https://fonts.googleapis.com/css?family=Hind\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("<br><br>\n");
      out.write("\n");
      out.write("<!-- 하단 이미지 -->\n");
      out.write("<div class=\"container\">\n");
      out.write("<a href=\"http://localhost:8080/mono/index.jsp\"><img src=\"../../images/logo.png\" class=\"img-responsive center-block\" alt=\"Responsive image\"></a>\n");
      out.write("<br><br>\n");
      out.write("</div>\n");
      out.write("<!-- //하단 이미지 -->\n");
      out.write("\n");
      out.write("<!-- 제작자표시 -->\n");
      out.write("<div class=\"container text-center\" style=\"font-family: 'Hind', sans-serif;\">\n");
      out.write("<label style=\"color: #949494;\">Copyright © 2016 NYC •</label>\n");
      out.write("<label> JangHyunJin</label>\n");
      out.write("<label style=\"color: #949494;\">by Underground Media •</label> \n");
      out.write("<label> Shopping Cart by JangHyunJin</label>\n");
      out.write("</div>\n");
      out.write("<!-- //제작자표시 -->\n");
      out.write("\n");
      out.write("<br>\n");
      out.write("\n");
      out.write("<!-- //footer -->\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</div>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
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

  private boolean _jspx_meth_c_005fif_005f0(javax.servlet.jsp.tagext.JspTag _jspx_th_c_005fforEach_005f0, javax.servlet.jsp.PageContext _jspx_page_context, int[] _jspx_push_body_count_c_005fforEach_005f0)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fforEach_005f0);
    // /board/qna/qnaList.jsp(193,6) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${q.b_state == '1'}", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
    if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write(" <img src=\"../../images/icon-angle-down.png\" alt=\"A\">");
        int evalDoAfterBody = _jspx_th_c_005fif_005f0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
    return false;
  }
}
