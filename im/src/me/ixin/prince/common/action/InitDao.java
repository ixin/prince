package me.ixin.prince.common.action;

import javax.servlet.http.HttpServlet;
import org.nutz.ioc.Ioc;
/**
 * Servlet implementation class InitDao
 * 本类用于web容器启动时初始化数据源，完成数据库连接。
 */
public class InitDao extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Ioc ioc = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InitDao() {
        super();
    }

	@Override
	public void destroy() {
		System.out.println("ooo__destroy");
		if(ioc != null)
			ioc.depose();
	}

	@Override
	public void init() {
		System.out.println("正在初始化数据源...");
		/*try{
			ioc = new NutIoc(new JsonLoader("dao.js"));
			DataSource ds = ioc.get(DataSource.class);
			new NutDao(ds);
		}catch(Exception e){
			System.out.println("初始化数据源发生错误！");
			e.printStackTrace();
			return;
		}*/
		System.out.println("初始化数据源完成.");
	}

}
