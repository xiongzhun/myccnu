package tool; /**
 * Author: WuHaoLin
 * Date: 2014/5/6
 * Time: 22:34
 */

import life.notice.ServiceNotice;
import org.codehaus.jackson.jaxrs.JacksonJsonProvider;
import org.glassfish.jersey.server.ResourceConfig;
import play.shop.ServiceShop;
import play.shudong.ServiceShuDong;
import play.shudong.ServiceShuDongBgImg;
import play.vote.ServiceVote;
import study.CET.ServiceCET;
import study.score.ServicePjxfScore;
import study.score.ServiceScore;
import tool.ccnu.student.ServiceStudents;
import tool.ccnu.student.detailInfo.ServiceStudentAllInfo;
import tool.feedback.ServiceFeedback;

/**
 * Created with Intellij IDEA.
 * User: WuHaoLin
 * Date: 2014/5/6
 * Time: 22:34
 */
public class RestConfig extends ResourceConfig {

    public RestConfig() {
        //加载Resource
        register(ServiceShuDong.class);
        register(ServiceShuDongBgImg.class);
        register(ServiceQiNiu.class);
        register(ServiceShop.class);
        register(ServiceStudents.class);
        register(ServiceVote.class);
        register(ServiceScore.class);
        register(ServiceNotice.class);
        register(ServicePjxfScore.class);
        register(ServiceFeedback.class);
        register(ServiceStudentAllInfo.class);
        register(ServiceCET.class);
        register(ServiceGithub.class);
        //注册数据转换器
        register(JacksonJsonProvider.class);

    }
}
