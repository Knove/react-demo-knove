package com.choice.Exception;

import com.choice.common.ServerResponse;
import com.choice.util.JsonUtils;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class PosExceptionResolver implements HandlerExceptionResolver {
    private Logger logger = Logger.getLogger(PosExceptionResolver.class);
    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {
    	e.printStackTrace();
        ServerResponse serverResponse = ServerResponse.createByErrorMessage(e.getMessage());
        try {
            httpServletResponse.setCharacterEncoding("utf-8");
            httpServletResponse.setContentType("text/html;charset=utf-8");
            PrintWriter printWriter = httpServletResponse.getWriter();
            printWriter.print(JsonUtils.objectToJson(serverResponse));
            logger.error(e.getClass()+":"+e.getMessage());
        } catch (IOException e1) {
            e1.printStackTrace();
        }
        return new ModelAndView();
    }
}
