<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kosta.matna.domain.admin.AD"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<a href='https://${AD.link }'><img width='650' height='205' src='/matna/resource/images/admin/ad/${AD.photo }'></a>

<input type="hidden" name="total" id="total" value="${total }" />