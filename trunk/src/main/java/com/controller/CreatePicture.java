package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.po.Login;
import com.po.Msg;
import com.po.ValidateCode;

@Controller
public class CreatePicture {
	/**
	 * 用于处理前端传回的ajax请求，也就是更新验证码中的数据
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/validateCode", method = RequestMethod.GET)
	public Msg validateCode(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 设置响应的类型格式为图片格式
		response.setContentType("image/jpeg");
		// 禁止图像缓存。
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		HttpSession session = request.getSession();
		ValidateCode vCode = new ValidateCode(120, 40, 5, 100);
		session.setAttribute("code", vCode.getCode());
		vCode.write(response.getOutputStream());
		return Msg.success().add("code", vCode.getCode());
	}
	/**
	 * 用于接收上面产生的动态的码的值，以及向前端传输这个值来校验数据
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/confimCode", method = RequestMethod.GET)
	public Msg confimCode(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 设置响应的类型格式为图片格式
		HttpSession session = request.getSession();
		String strCode=String.valueOf(session.getAttribute("code"));
		return Msg.success().add("code",strCode);
	}
}
