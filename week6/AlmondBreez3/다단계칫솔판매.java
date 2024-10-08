package week6.AlmondBreez3;
import java.util.*;

// 너무 힘들게 풀었음. 다시 복습할때 가볍게 접근해보자
// 오답: 제대로 넣어지는지 확인하고 답을 확신하자..
class 다단계칫솔판매 {
    public HashMap<String, String> referralMap = new HashMap<>();
    public HashMap<String, Integer> result = new HashMap<>();

    public int[] solution(String[] enroll, String[] referral, String[] seller, int[] amount) {
        for (int i = 0; i < enroll.length; i++) {
            referralMap.put(enroll[i], referral[i]);
            result.put(enroll[i], 0);
        }

        for (int i = 0; i < seller.length; i++) {
            distributeEarnings(seller[i], amount[i] * 100);
        }

        int[] answer = new int[enroll.length];
        for (int i = 0; i < enroll.length; i++) {
            answer[i] = result.get(enroll[i]);
        }

        return answer;
    }

    public void distributeEarnings(String seller, int amount) {
        while (!seller.equals("-") && amount > 0) {
            int commission = amount / 10;
            int earnings = amount - commission;
            result.put(seller, result.get(seller) + earnings);
            seller = referralMap.get(seller);
            amount = commission;
        }
    }
}

