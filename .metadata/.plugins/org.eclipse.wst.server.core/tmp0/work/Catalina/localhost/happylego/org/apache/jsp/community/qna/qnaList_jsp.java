/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.36
 * Generated at: 2016-09-20 08:53:22 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.community.qna;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.HashMap;
import java.util.Map;
import communtity.business.QnaDto;
import java.util.ArrayList;

public final class qnaList_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(4);
    _jspx_dependants.put("/community/qna/../../header.jsp", Long.valueOf(1473658189000L));
    _jspx_dependants.put("/community/qna/../../footer.jsp", Long.valueOf(1473405622000L));
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1473405622000L));
    _jspx_dependants.put("jar:file:/Users/All/Documents/work/workspace/websou/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/happylego/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153352682000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("communtity.business.QnaDto");
    _jspx_imports_classes.add("java.util.Map");
    _jspx_imports_classes.add("java.util.HashMap");
    _jspx_imports_classes.add("java.util.ArrayList");
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody;
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
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.release();
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
 request.setCharacterEncoding("utf-8"); 
      out.write('\n');
      communtity.business.QnaBean bean = null;
      bean = (communtity.business.QnaBean) _jspx_page_context.getAttribute("bean", javax.servlet.jsp.PageContext.PAGE_SCOPE);
      if (bean == null){
        bean = new communtity.business.QnaBean();
        _jspx_page_context.setAttribute("bean", bean, javax.servlet.jsp.PageContext.PAGE_SCOPE);
      }
      out.write('\n');
      happy.mybatis.ProcessDao processDao = null;
      processDao = (happy.mybatis.ProcessDao) _jspx_page_context.getAttribute("processDao", javax.servlet.jsp.PageContext.PAGE_SCOPE);
      if (processDao == null){
        processDao = new happy.mybatis.ProcessDao();
        _jspx_page_context.setAttribute("processDao", processDao, javax.servlet.jsp.PageContext.PAGE_SCOPE);
      }
      out.write('\n');
 


int spage = 0; //현재페이지
int pageCount = 10; // 1페이지에 10개 칼럼
int sblock = 0; //현재 블럭
int blockCount = 10; //1블럭에 10개 페이수

int totalPage = processDao.totalPage(); //총페이지수
int totalBlock = processDao.totalBlock(totalPage); // 총블럭

try{
	sblock = Integer.parseInt(request.getParameter("block"));
}catch(Exception e){
	sblock = 1; //parameter pageBlock의 값이 제대로 안들어오면 1;
}
if(sblock <= 0) sblock = 1; //parameter pageBlock의 값이 이상한 값이면 1; 
 
try{
	spage = Integer.parseInt(request.getParameter("page"));
}catch(Exception e){
	spage = 1; //parameter page의 값이 제대로 안들어오면 1;
}
if(spage <= 0) spage = 1; //parameter page의 값이 이상한 값이면 1; 

int startPage = ((sblock-1)*pageCount)+1; //이전페이지 = ((현재블록-1)*10개칼럼)+1 항상 10의배수만 설정
int endPage = startPage + pageCount -1; //다음 페이지 

if (endPage > totalPage) endPage = totalPage; //10개씩 페이지를 생성하다보면 총 페이지보다 (빈페이지) 많이 생길수 있으므로 넘어갈경우 재설정; 

//검색이 있는 경우
String stype = request.getParameter("stype");
String sword = request.getParameter("sword");

Map<String, String> mapSerach = new HashMap<String, String>();

mapSerach.put("stype", stype);
mapSerach.put("sword", sword);

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<title>해피레고</title>\n");
      out.write("<link href='http://fonts.googleapis.com/css?family=Play:400,700' rel='stylesheet' type='text/css'>\n");
      out.write("<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"../../css/common.css\"  media=\"screen\">\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"../../css/content.css\"  media=\"screen\">\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"../../css/base.css\" media=\"screen\">\n");
      out.write("<link rel=\"shortcut icon\" href=\"../../images/lego_32.ico\">\n");
      out.write("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js\"></script>\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("function getPassword(b_no) {\n");
      out.write("\tvar f = document.qnaPwdFrm;\n");
      out.write("\tf.b_no.value = b_no;\n");
      out.write("\n");
      out.write("\t$(\"#qna_pwd\").show();\n");
      out.write("\n");
      out.write("}\n");
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
      out.write("\t$(\"#qna_pwd\").hide();\n");
      out.write("}\n");
      out.write("\n");
      out.write("function serach(){\n");
      out.write("\tif(document.searchFrm.sword.value == \"\"){\n");
      out.write("\t\tdocument.searchFrm.sword.focus();\n");
      out.write("\t\talert(\"검색어를 입력하시오!\");\n");
      out.write("\t\treturn;\n");
      out.write("\t}\n");
      out.write("\tdocument.searchFrm.submit();\n");
      out.write("}\n");
      out.write("\n");
      out.write("</script>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("<!-- header -->\n");
      out.write('\n');
 String idkey = (String)session.getAttribute("idkey"); 
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<title>Insert title here</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("<!-- wrap -->\n");
      out.write("<section id=\"wrap\">\n");
      out.write("    <!-- header -->\n");
      out.write("    <header id=\"header\" >\n");
      out.write("\t\t<!-- <h1><a href=\"http://localhost/happylego\"><img src=\"../../images/lego_128.png\" alt=\"해피레고\" /></a></h1>  -->\n");
      out.write("\t\t<h1><a href=\"http://localhost:8080/happylego\"><img src=\"../../images/lego_128.png\" alt=\"해피레고\" /></a></h1>\n");
      out.write("        <!-- header_wrap -->\n");
      out.write("        <section class=\"header_wrap\">            \n");
      out.write("            <!-- gnb -->\n");
      out.write("            <nav class=\"gnb\" style=\"background-color: white; box-shadow: none;\">\n");
      out.write("                <ul>\n");
      out.write("                    <li ><a href=\"../../service/product/product.jsp\" title=\"서비스 신청\">서비스 신청</a></li>\n");
      out.write("                    <li ><a href=\"../../company/happy/companyindex.jsp\" title=\"해피레고\">해피레고</a></li>\n");
      out.write("                    <li ><a href=\"../../guide/guidelist/guideindex.jsp\" title=\"이용가이드\"> 이용안내</a></li>\n");
      out.write("                    <li ><a href=\"../../community/qna/qnaList.jsp\" title=\"커뮤니티\">커뮤니티</a></li>\n");
      out.write("                    ");
if(idkey == null){
      out.write("\n");
      out.write("                    <li ><a href=\"../../mypage/member/login.jsp\" title=\"마이페이지\">마이페이지</a></li>\n");
      out.write("                    ");
}else if(idkey.equals("manager")){
      out.write("\n");
      out.write("                    <li ><a href=\"../../mypage/admin/manager.jsp\" title=\"마이페이지\">관리자</a></li>\n");
      out.write("\t\t\t\t\t");
}else if(idkey != null){
      out.write("\n");
      out.write("\t\t\t\t\t<li ><a href=\"../../mypage/member/myinfo.jsp\" title=\"마이페이지\">마이페이지</a></li>\n");
      out.write("\t\t\t\t\t");
}
      out.write("\n");
      out.write("                </ul>\n");
      out.write("            </nav>\n");
      out.write("            <!-- //gnb -->\n");
      out.write("            <!--<p class=\"top_tel\"><span class=\"title\">고객센터</span><span class=\"num f_play_R\">(064)746-0700</span></p>-->           \n");
      out.write("        </section>\n");
      out.write("        <!-- //header_wrap -->\n");
      out.write("\t\t<!-- global_menu -->\n");
      out.write("            <ul class=\"global_menu\">\n");
      out.write("      \t\t\t");
if(idkey == null){
      out.write("\n");
      out.write("               \t<li><a href=\"../../mypage/member/login.jsp\" title=\"로그인\">로그인</a></li>\n");
      out.write("\t\t\t\t");
}else if(idkey != null){
      out.write("\n");
      out.write("\t\t\t\t<li ><a href=\"../../mypage/member/logout.jsp\" title=\"로그아웃\">로그아웃</a></li>\n");
      out.write("\t\t\t\t");
}
      out.write("\n");
      out.write("               \n");
      out.write("\t\t\t   <li class=\"last\"><a href=\"../../company/happy/companyindex.jsp\" title=\"찾아오시는길\">찾아오시는길</a></li>\n");
      out.write("            </ul>\n");
      out.write("            <!-- //global_menu -->\n");
      out.write("    </header>\n");
      out.write("    <!-- //header -->\n");
      out.write("    \n");
      out.write("    \n");
      out.write("  <!-- //footer -->\n");
      out.write("    <aside id=\"pop\" style=\"display:none;\">\n");
      out.write("        <!-- pop_table -->\n");
      out.write("        <section class=\"pop_table\">\n");
      out.write("            <!-- pop_cell -->\n");
      out.write("            <div class=\"pop_cell\" id=\"popdetail\">\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("    </aside>\n");
      out.write("    <div id=\"commonLayer\">\n");
      out.write("        \n");
      out.write("    </div>\n");
      out.write("</section>\n");
      out.write("<!-- //wrap -->\n");
      out.write("\n");
      out.write("\n");
      out.write("<!--   -->\n");
      out.write("\n");
      out.write("\n");
      out.write("    \n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>");
      out.write('\n');
      //  c:set
      org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_005fset_005f0 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
      _jspx_th_c_005fset_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fset_005f0.setParent(null);
      // /community/qna/qnaList.jsp(98,0) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f0.setVar("idkey");
      // /community/qna/qnaList.jsp(98,0) name = value type = javax.el.ValueExpression reqTime = true required = false fragment = false deferredValue = true expectedTypeName = java.lang.Object deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f0.setValue(idkey);
      int _jspx_eval_c_005fset_005f0 = _jspx_th_c_005fset_005f0.doStartTag();
      if (_jspx_th_c_005fset_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f0);
        return;
      }
      _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f0);
      out.write(" <!-- 관리자키 -->\n");
      out.write("<!-- //header -->\n");
      out.write("\n");
      out.write("<article class=\"sub_visual sub01\">\n");
      out.write("    <h3 class=\"big_title\">커뮤니티</h3>\n");
      out.write("    <h4 class=\"sub_title\">해피레고를 찾아주셔서 감사합니다.</h4>\n");
      out.write("</article>\n");
      out.write("\n");
      out.write("<section id=\"container\">\n");
      out.write("    <section id=\"contents\" class=\"icon_sub nomember\">\n");
      out.write("\n");
      out.write("<p>\n");
      out.write("\t<img src=\"../../images/icon_community.png\" alt=\"\" />\n");
      out.write("</p>\n");
      out.write("<!-- sub_tab -->\n");
      out.write("<div class=\"sub_tab review_tab\">\n");
      out.write("\t<ul>\n");
      out.write("\t\t<li class=\"actived\"><a href=\"qnaList.jsp\" title=\"Q&A\" class=\"letter\">Q&amp;A</a></li>\n");
      out.write("\t\t<li><a href=\"../faq/faqList.jsp\" title=\"자주묻는질문\">자주묻는질문</a></li>\n");
      out.write("\t\t<li class=\"last\"><a href=\"../notice/noticeList.jsp\" title=\"공지사항\">공지사항</a></li>\n");
      out.write("\t</ul>\n");
      out.write("</div>\n");
      out.write("<!-- //sub_tab -->\t\t\n");
      out.write("    <!-- default_con -->\n");
      out.write("\t<div class=\"default_con\">\n");
      out.write("<!-- list_sort_wrap -->\n");
      out.write("<div>\n");
      out.write("<form action=\"qnaList.jsp\" name=\"searchFrm\" method=\"post\">\n");
      out.write("<div class=\"list_sort_wrap\">\n");
      out.write("\t<div style=\"margin-left: 1000px\"><select name=\"stype\">\n");
      out.write("\t\t<option value=\"b_title\" selected=\"selected\">글제목</option>\n");
      out.write("\t\t<option value=\"b_id\">글작성자</option>\n");
      out.write("\t</select>\n");
      out.write("\t</div>\n");
      out.write("\t<div class=\"list_search\">\n");
      out.write("\t<p class=\"l_s_input\"><input type=\"text\" name=\"sword\" placeholder=\"검색어를 입력하세요\"></p>\n");
      out.write("\t<p class=\"l_s_btn\"><a href=\"javascript:serach();\"><img src=\"../../images/btn_list_search.gif\" alt=\"\" width=\"\"></a></p>\n");
      out.write("\t</div>\n");
      out.write("</div>\n");
      out.write("</form>\n");
      out.write("</div>\n");
      out.write("<div>\n");
      out.write("<!-- qna_list -->\n");
      out.write("<div class=\"qna_list\">\n");
      out.write("    <table class=\"c_table_01\">\n");
      out.write("        <caption>테이블 제목</caption>\n");
      out.write("\t\t<colgroup>\n");
      out.write("\t\t<col class=\"t_layout_c qna_01\">\n");
      out.write("\t\t<col class=\"m_layout_c qna_02\">\n");
      out.write("\t\t<col class=\"m_layout_c qna_03\">\n");
      out.write("\t\t<col class=\"t_layout_c qna_04\">\n");
      out.write("\t\t<col class=\"d_layout_c qna_05\">\n");
      out.write("\t\t</colgroup>\n");
      out.write("<thead>\n");
      out.write("    <tr>\n");
      out.write("        <th scope=\"col\" class=\"t_layout_t bl\">번호</th>\n");
      out.write("        <th scope=\"col\" class=\"m_layout_t ml\">제목</th>\n");
      out.write("        <th scope=\"col\" class=\"m_layout_t mr\">작성자</th>\n");
      out.write("        <th scope=\"col\" class=\"t_layout_t mr\">등록일</th>\n");
      out.write("        <th scope=\"col\" class=\"d_layout_t br\">조회수</th>\n");
      out.write("    </tr>\n");
      out.write("</thead>\n");

	ArrayList<QnaDto> list = null;
	int start = (spage-1) * pageCount;
	if(sword == null) 
		list = (ArrayList)processDao.qnaAll(start);
	else
		list = (ArrayList)processDao.qnaSearch(mapSerach);

      out.write(' ');
      out.write('\n');
      out.write('	');
      //  c:forEach
      org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_005fforEach_005f0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
      _jspx_th_c_005fforEach_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fforEach_005f0.setParent(null);
      // /community/qna/qnaList.jsp(168,1) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fforEach_005f0.setVar("d");
      // /community/qna/qnaList.jsp(168,1) name = items type = javax.el.ValueExpression reqTime = true required = false fragment = false deferredValue = true expectedTypeName = java.lang.Object deferredMethod = false methodSignature = null
      _jspx_th_c_005fforEach_005f0.setItems(list );
      int[] _jspx_push_body_count_c_005fforEach_005f0 = new int[] { 0 };
      try {
        int _jspx_eval_c_005fforEach_005f0 = _jspx_th_c_005fforEach_005f0.doStartTag();
        if (_jspx_eval_c_005fforEach_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
          do {
            out.write("\n");
            out.write("\t\t<tr>\n");
            out.write("\t\t<td class=\"t_layout_t bl\"><span class=\"f_play_R\">");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${d.b_no}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("</span></td>\n");
            out.write("\t\t<td class=\"m_layout_t ml tl\"><img src=\"../../images/icon_q.png\" alt=\"Q\" class=\"vtm\" width=\"31\">\n");
            out.write("\t\t");
            if (_jspx_meth_c_005fif_005f0(_jspx_th_c_005fforEach_005f0, _jspx_page_context, _jspx_push_body_count_c_005fforEach_005f0))
              return;
            out.write("\n");
            out.write("\t\t<a href= \"javascript:getPassword('");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${d.b_no}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("')\" class=\"vtm m_l_5\">");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${d.b_title}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("</a>\n");
            out.write("\t\t<img src=\"../../images/icon_lock.png\" alt=\"\" class=\"m_l_10\" width=\"14\" width=\"14\">\n");
            out.write("\t\t");
            if (_jspx_meth_c_005fif_005f1(_jspx_th_c_005fforEach_005f0, _jspx_page_context, _jspx_push_body_count_c_005fforEach_005f0))
              return;
            out.write("\n");
            out.write("\t\t</td>\n");
            out.write("\t\t<td class=\"m_layout_t mr\">");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${d.b_id}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("</td>\n");
            out.write("\t\t<td class=\"t_layout_t mr\"><span class=\"f_play_R\">");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${d.b_date}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("</span></td>\n");
            out.write("\t\t<td class=\"d_layout_t br\"><span class=\"f_play_R\">");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${d.b_read}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("</span></td>\n");
            out.write("\t\t</tr>\n");
            out.write("\t\t");
            if (_jspx_meth_c_005fset_005f1(_jspx_th_c_005fforEach_005f0, _jspx_page_context, _jspx_push_body_count_c_005fforEach_005f0))
              return;
            out.write('\n');
            out.write('	');
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
      out.write("\t\n");
      out.write("\t</tbody>\n");
      out.write("</table>\n");
      out.write("</div>\n");
      out.write("\t<div class=\"btn_list b_r\">\n");
      out.write("\t\t<a href=\"qnaWrite.jsp\" title=\"등록하기\" class=\"type02\">등록하기</a>\n");
      out.write("\t</div>\n");
      out.write("<div class=\"paging\">\n");

out.print("<a href='qnaList.jsp?block=1&page=1' class='prevEnd'><img src='../../images/prevEnd.gif' alt='맨처음'></a>");
if(sblock <= 1){
	out.print("<span class='prev'><img src='../../images/prev.gif' alt='이전 10개'></span>" );
}else{ //(startPage-1) 은 startPage는 항상 10의 배수만 가리키므로 이전을 누르면 (10-9)로 9페이지이동 (20-1) 19페이지 이동
	out.print("<a href='qnaList.jsp?block=" + (sblock-1) + "&page=" + (startPage-1) + "' class='prev'>"+ 
				"<img src='../../images/prev.gif' alt='이전 10개'></a>");
}
for(int i = startPage; i <= endPage; i++){
	if(i == spage){ //spage 현재페이지
		out.print("<strong class='border'>" + i + "</strong>");					
	}else{
		out.print("&nbsp;<a href='qnaList.jsp?block=" + sblock + "&page=" + i + "'>" +i+ "</a>&nbsp;");
	}
}
if(sblock >= totalBlock){ 
	out.print("<span class='next'><img src='../../images/next.gif' alt='다음 10개'></span");
}else{ //(endPage+1) 은 endPage는 항상 10의 배수만 가리키므로 다음을 가리면 (10+1)로 11페이지이동 (20+1) 21페이지이동(endPage가 totalPage보다 넘어갈경우 같게 설정)
	out.print("<a href='qnaList.jsp?block=" + (sblock+1) + "&page=" + (endPage+1) + "' class='next'>"+
				"<img src='../../images/next.gif' alt='다음 10개'></a>");
}
out.print("<a href='qnaList.jsp?block=" + totalBlock + "&page=" + (totalPage) + "' class='nextEnd'>" +
			"<img src='../../images/nextEnd.gif' alt='맨마지막'></a>");

      out.write("\n");
      out.write("</div>\n");
      out.write(" <!-- //list_view -->\n");
      out.write("<div>\n");
      out.write("<form name=\"qnaPwdFrm\" method=\"post\" action=\"qnaView.jsp\">\n");
      out.write("\t<input type=\"hidden\" name=\"b_no\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${b_no}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\" /> \n");
      out.write("\t<input type=\"hidden\" name=\"page\" value=\"");
      out.print(spage);
      out.write("\" /> \n");
      out.write("\t<input type=\"hidden\" name=\"block\" value=\"");
      out.print(sblock);
      out.write("\" />\n");
      out.write("\t<input type=\"hidden\" name=\"b_state\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${b_state}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\" />\n");
      out.write("\t\t<div class=\"pw_pop\" id=\"qna_pwd\" style=\"display: none;\">\n");
      out.write("\t\t<p class=\"title\">비밀번호 확인</p>\n");
      out.write("\t\t<p class=\"info\">이 게시글의 비밀번호를 입력해주세요</p>\n");
      out.write("\t\t<p class=\"input_pw\">\n");
      out.write("\t\t\t<input type=\"password\" maxlength=\"20\" name=\"b_pass\" id=\"\" /> \n");
      out.write("\t\t\t<a href=\"javascript:checkPwdFrm();\" onclick=\"\" title=\"확인\" class=\"btn_com\">확인</a>\n");
      out.write("\t\t</p>\n");
      out.write("\t\t\t<a href=\"javascript:closePwd();\" class=\"btn_close\"><img src=\"../../images/btn_pop_close.png\" alt=\"\"></a>\n");
      out.write("\t\t</div>\n");
      out.write("</form>\n");
      out.write("</div>\n");
      out.write("     </div>\n");
      out.write("     <!-- //qna_list -->\n");
      out.write("        </div>\n");
      out.write("        <!-- //default_con -->\n");
      out.write("    </section>\n");
      out.write("    <!-- //contents -->\n");
      out.write("</section>\n");
      out.write("<!-- //container -->\n");
      out.write("\n");
      out.write("<!-- footer -->\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<title>Insert title here</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<!-- footer -->\n");
      out.write("<footer id=\"footer\">\n");
      out.write("\t<section class=\"footer_wrap\">\n");
      out.write("\t\t<h2>\n");
      out.write("\t\t\t<img src=\"../../images/lego_128.png\" alt=\"해피레고\" width=\"5%\" />\n");
      out.write("\t\t</h2>\n");
      out.write("\t\t<address>\n");
      out.write("\t\t\t해피레고&nbsp;&nbsp;|&nbsp;&nbsp; 프로젝트\n");
      out.write("\t\t\t&nbsp;&nbsp;|&nbsp;&nbsp;팀 : 장현진, 이연남, 이동규, 오현은\n");
      out.write("\t\t\t&nbsp;&nbsp;|&nbsp;&nbsp;주소지 : 서울특별시 강남 에이콘아카데미<br>\n");
      out.write("\t\t\t사업자등록번호 : 000-0000-0000&nbsp;&nbsp;|&nbsp;&nbsp;통신판매신고번호 : 제\n");
      out.write("\t\t\t0000-서울강남-0000호&nbsp;&nbsp;|&nbsp;&nbsp;<span class=\"letter\">TEL\n");
      out.write("\t\t\t: 1004-1004</span>&nbsp;&nbsp;|&nbsp;&nbsp;<span class=\"letter\">Fax\n");
      out.write("\t\t\t: 000-000-0000</span><br> <span class=\"letter\">COPYRIGHT©2016\n");
      out.write("\t\t\tHAPPY LEGO. ALL RIGHTS RESERVED.</span>\n");
      out.write("\t\t</address>\n");
      out.write("\t</section>\n");
      out.write("</footer>\n");
      out.write("<!-- //footer -->\n");
      out.write("</body>\n");
      out.write("</html>");
      out.write("\n");
      out.write("<!-- //footer -->\n");
      out.write("\n");
      out.write("\n");
      out.write("</body>\n");
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

  private boolean _jspx_meth_c_005fif_005f0(javax.servlet.jsp.tagext.JspTag _jspx_th_c_005fforEach_005f0, javax.servlet.jsp.PageContext _jspx_page_context, int[] _jspx_push_body_count_c_005fforEach_005f0)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fforEach_005f0);
    // /community/qna/qnaList.jsp(172,2) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${d.b_state eq 1}", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
    if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write(" <!-- 답변이 달렸을 때 1 안달렸을 때 0-->\n");
        out.write("\t\t<img src=\"../../images/icon_a.png\" alt=\"A\" width=\"31\">\n");
        out.write("\t\t");
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

  private boolean _jspx_meth_c_005fif_005f1(javax.servlet.jsp.tagext.JspTag _jspx_th_c_005fforEach_005f0, javax.servlet.jsp.PageContext _jspx_page_context, int[] _jspx_push_body_count_c_005fforEach_005f0)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f1 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f1.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f1.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fforEach_005f0);
    // /community/qna/qnaList.jsp(177,2) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f1.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${idkey == 'manager'}", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_005fif_005f1 = _jspx_th_c_005fif_005f1.doStartTag();
    if (_jspx_eval_c_005fif_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write(' ');
        out.write(':');
        out.write(' ');
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${d.b_pass}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
        int evalDoAfterBody = _jspx_th_c_005fif_005f1.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f1);
    return false;
  }

  private boolean _jspx_meth_c_005fset_005f1(javax.servlet.jsp.tagext.JspTag _jspx_th_c_005fforEach_005f0, javax.servlet.jsp.PageContext _jspx_page_context, int[] _jspx_push_body_count_c_005fforEach_005f0)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:set
    org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_005fset_005f1 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
    _jspx_th_c_005fset_005f1.setPageContext(_jspx_page_context);
    _jspx_th_c_005fset_005f1.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fforEach_005f0);
    // /community/qna/qnaList.jsp(183,2) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fset_005f1.setVar("b_state");
    // /community/qna/qnaList.jsp(183,2) name = value type = javax.el.ValueExpression reqTime = true required = false fragment = false deferredValue = true expectedTypeName = java.lang.Object deferredMethod = false methodSignature = null
    _jspx_th_c_005fset_005f1.setValue(new org.apache.jasper.el.JspValueExpression("/community/qna/qnaList.jsp(183,2) '${d.b_state}'",_jsp_getExpressionFactory().createValueExpression(_jspx_page_context.getELContext(),"${d.b_state}",java.lang.Object.class)).getValue(_jspx_page_context.getELContext()));
    int _jspx_eval_c_005fset_005f1 = _jspx_th_c_005fset_005f1.doStartTag();
    if (_jspx_th_c_005fset_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f1);
    return false;
  }
}
