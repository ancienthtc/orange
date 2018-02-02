package com.jd.orange.util.api.wx;

import java.io.InputStream;

public class ConfigPay extends WXPayConfig{
    @Override
    protected String getAppID() {
        return "wx9e179bc3ebf0c798";
    }

    @Override
    public String getMchID() {
        return "1382668802";
    }

    @Override
    protected String getKey() {
        return "P3huR3cB1JrVD6hliKEQ4SvWar41xsKA";
    }

    @Override
    protected InputStream getCertStream() {
        return null;
    }

    @Override
    public int getHttpConnectTimeoutMs() {
        return super.getHttpConnectTimeoutMs();
    }

    @Override
    public int getHttpReadTimeoutMs() {
        return super.getHttpReadTimeoutMs();
    }

    @Override
    protected IWXPayDomain getWXPayDomain() {
        return null;
    }

    @Override
    public boolean shouldAutoReport() {
        return super.shouldAutoReport();
    }

    @Override
    public int getReportWorkerNum() {
        return super.getReportWorkerNum();
    }

    @Override
    public int getReportQueueMaxSize() {
        return super.getReportQueueMaxSize();
    }

    @Override
    public int getReportBatchSize() {
        return super.getReportBatchSize();
    }
}
