package com.hidear.exam.modular.controller;

import com.hidear.exam.modular.controller.domain.QuestionImproveResult;
import com.hidear.exam.modular.model.question.KnowledgePoint;
import com.hidear.exam.modular.model.question.QuestionHistory;
import com.hidear.exam.modular.model.question.UserQuestionHistory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Created by Administrator on 2017/7/19.
 */
@Controller
public class UserCenterController {

    /**
     * 用户中心主页
     *
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "/student/usercenter", method = RequestMethod.GET)
    public String userCenterPage(Model model, HttpServletRequest request) {


        model.addAttribute("username", "13594298580");
        model.addAttribute("email", "2256935429@qq.com");
        model.addAttribute("field", "语文");
        model.addAttribute("lastLoginTime", "192222222222222");

        UserQuestionHistory uqh = new UserQuestionHistory();

        List<KnowledgePoint> pointList = new ArrayList<>();
        List<KnowledgePoint> pointList1 = new ArrayList<KnowledgePoint>();
        List<Integer> pointIdList = new ArrayList<Integer>();
        List<StatisticsResult> srList = new ArrayList<StatisticsResult>();
        Map<Integer, Map<Integer, QuestionHistory>> history;
        pointList.addAll(pointList1);

        for (KnowledgePoint kp : pointList) {

            pointIdList.add(kp.getPointId());
        }

        List<QuestionImproveResult> questionImproveList = new ArrayList<>();

        Map<Integer, Integer> pointStatisticMap = new HashMap<Integer, Integer>();

        for (QuestionImproveResult qir : questionImproveList) {
            int amount = 0;
            if(pointStatisticMap.containsKey(qir.getQuestionPointId()))
                amount = pointStatisticMap.get(qir.getQuestionPointId());
            //主观题不参加统计 2014-08-13
            if(qir.getQuestionTypeId() == 1 || qir.getQuestionTypeId() == 2 || qir.getQuestionTypeId() == 3 || qir.getQuestionTypeId() == 4)
                amount += qir.getAmount();
            //主观题不参加统计 2014-08-13
            //amount += pointStatisticMap.get(qir.getQuestionPointId());
            pointStatisticMap.put(qir.getQuestionPointId(), amount);
        }

        Map<Integer, QuestionHistory> rightMap = new HashMap<Integer, QuestionHistory>();
        Map<Integer, QuestionHistory> wrongMap = new HashMap<Integer, QuestionHistory>();

        for (KnowledgePoint kp : pointList) {
            StatisticsResult sr = new StatisticsResult();
            sr.setPointId(kp.getPointId());
            sr.setPointName(kp.getPointName());
            if (uqh != null) {
                history = uqh.getHistory();
                if (history.containsKey(0))
                    wrongMap = history.get(0);
                if (history.containsKey(1))
                    rightMap = history.get(1);
                Iterator<Integer> rightIt = rightMap.keySet().iterator();
                Iterator<Integer> wrongIt = wrongMap.keySet().iterator();
                int rightAmount = 0;
                int wrongAmount = 0;
                while (rightIt.hasNext()) {
                    int key = rightIt.next();
                    QuestionHistory tmpQh = rightMap.get(key);
                    if (tmpQh.getPointId() == kp.getPointId())
                        rightAmount++;
                }
                while (wrongIt.hasNext()) {
                    int key = wrongIt.next();
                    QuestionHistory tmpQh = wrongMap.get(key);
                    if (tmpQh.getPointId() == kp.getPointId())
                        wrongAmount++;
                }
                sr.setRightTimes(rightAmount);
                sr.setWrongTimes(wrongAmount);
                int amount = 0;
                if(pointStatisticMap.containsKey(sr.getPointId()))
                    amount = pointStatisticMap.get(sr.getPointId());
                System.out.println("amount=" + amount);
                float rightRate = rightAmount + wrongAmount != 0 ? (float) Math
                        .round((float) rightAmount * 10000f / amount) / 10000f
                        : 0f;
                System.out.println("rightRate=" + rightRate);
                float finishRate = amount != 0 ? (float) Math
                        .round((float) (rightAmount + wrongAmount) * 10000f
                                / amount) / 10000f : 0f;
                System.out.println("finishRate=" + finishRate);
                sr.setRightRate(rightRate);
                sr.setFinishRate(finishRate);
            }
            sr.setAmount(pointStatisticMap.get(kp.getPointId()) == null ? 0 : pointStatisticMap.get(kp.getPointId()));
            srList.add(sr);
        }

        model.addAttribute("sr", srList);
        model.addAttribute("labels", this.generateLables(srList));
        model.addAttribute("finishrate", this.generateFinishData(srList));
        model.addAttribute("correctrate", this.generateCorrectData(srList));
        return "/student/usercenter.html";
    }

    private String generateLables(List<StatisticsResult> srList) {
        StringBuilder sb = new StringBuilder();

        for (int i = 0; i < srList.size(); i++) {
            sb.append("\"");
            sb.append(srList.get(i).getPointName());
            sb.append("\"");
            if (i != srList.size() - 1)
                sb.append(",");
        }
        return sb.toString();

    }

    private String generateFinishData(List<StatisticsResult> srList) {
        StringBuilder sb = new StringBuilder();

        for (int i = 0; i < srList.size(); i++) {
            sb.append(srList.get(i).getFinishRate() * 100);
            if (i != srList.size() - 1)
                sb.append(",");
        }
        return sb.toString();
    }

    private String generateCorrectData(List<StatisticsResult> srList) {
        StringBuilder sb = new StringBuilder();

        for (int i = 0; i < srList.size(); i++) {
            sb.append(srList.get(i).getRightRate() * 100);

            if (i != srList.size() - 1)
                sb.append(",");
        }
        return sb.toString();
    }

    public class StatisticsResult {
        public int pointId;
        public String pointName;
        public int amount;
        public int rightTimes;
        public int wrongTimes;
        public float finishRate;
        public float rightRate;

        public float getFinishRate() {
            return finishRate;
        }

        public void setFinishRate(float finishRate) {
            this.finishRate = finishRate;
        }

        public float getRightRate() {
            return rightRate;
        }

        public void setRightRate(float rightRate) {
            this.rightRate = rightRate;
        }

        public int getPointId() {
            return pointId;
        }

        public void setPointId(int pointId) {
            this.pointId = pointId;
        }

        public String getPointName() {
            return pointName;
        }

        public void setPointName(String pointName) {
            this.pointName = pointName;
        }

        public int getAmount() {
            return amount;
        }

        public void setAmount(int amount) {
            this.amount = amount;
        }

        public int getRightTimes() {
            return rightTimes;
        }

        public void setRightTimes(int rightTimes) {
            this.rightTimes = rightTimes;
        }

        public int getWrongTimes() {
            return wrongTimes;
        }

        public void setWrongTimes(int wrongTimes) {
            this.wrongTimes = wrongTimes;
        }

    }
}
