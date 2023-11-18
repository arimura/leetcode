
public class Main {
    public static void main(String[] args) {
        System.out.println(canPlaceFlowers(new int[]{1,0,0,0,1},1));
        System.out.println(canPlaceFlowers(new int[]{1,0,0,0,1},2));
    }
    
    public static boolean canPlaceFlowers(int[] flowerbed, int n) {
        if (n == 0){
            return true;
        }

        int flowerbedLen = flowerbed.length;
        for (int i=0; i< flowerbedLen;i++){
            //already planted
            if(flowerbed[i] == 1) continue;
            
            // check adjacent rule
            if (i != 0 && flowerbed[i-1] == 1){
                //violating
                continue;
            } 
            if(i != flowerbedLen -1 && flowerbed[i+1] == 1){
                continue;
            }
            //planted
            flowerbed[i] = 1;

            //next
            boolean ok = canPlaceFlowers(flowerbed, n -1);
            if (ok) return true;
        }
        return false;
    }
}
