package me.ixin.prince;

import org.nutz.mvc.annotation.IocBy;
import org.nutz.mvc.annotation.Modules;
import org.nutz.mvc.ioc.provider.AnnotationIocProvider;

@Modules(scanPackage = true)
@IocBy(type = AnnotationIocProvider.class, args = {"me.ixin.prince.post.dao.impl","me.ixin.prince.post.service.impl","me.ixin.prince.post.action"})
public class MainModule {
	
}
