package com.jd.orange.service.servciceImpl;

import com.jd.orange.dao.FormatMapper;
import com.jd.orange.model.Format;
import com.jd.orange.service.FormatService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class FormatServiceImpl implements FormatService{

    @Resource
    private FormatMapper formatMapper;

    @Override
    public List<Format> formatList(Integer gid) {
        return formatMapper.formatList(gid);
    }
}
