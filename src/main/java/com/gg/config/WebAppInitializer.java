package com.gg.config;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.filter.DelegatingFilterProxy;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRegistration;
import jakarta.servlet.FilterRegistration;

public class WebAppInitializer implements WebApplicationInitializer {

    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {

        AnnotationConfigWebApplicationContext context =
                new AnnotationConfigWebApplicationContext();

        context.register(
                WebMvcConfig.class,
                DBConfig.class,
                SecurityConfig.class
        );

        DispatcherServlet dispatcherServlet =
                new DispatcherServlet(context);

        ServletRegistration.Dynamic servlet =
                servletContext.addServlet("dispatcher", dispatcherServlet);

        servlet.setLoadOnStartup(1);
        servlet.addMapping("/");

        // 🔥 VERY IMPORTANT FOR SECURITY
        FilterRegistration.Dynamic securityFilter =
                servletContext.addFilter("springSecurityFilterChain",
                        new DelegatingFilterProxy("springSecurityFilterChain"));

        securityFilter.addMappingForUrlPatterns(null, false, "/*");
    }
}