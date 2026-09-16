package com.skrozana.util;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class AppContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("SKRozanaBazaar Application Starting...");
        // Initialize the background image task worker
        ImageTaskWorker.getInstance();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("SKRozanaBazaar Application Shutting Down...");
        ImageTaskWorker.getInstance().shutdown();
    }
}
