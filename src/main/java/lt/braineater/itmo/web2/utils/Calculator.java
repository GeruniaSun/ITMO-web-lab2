package lt.braineater.itmo.web2.utils;

public class Calculator {
    public static boolean calcHit(Point p) {
        return calcHit(p.x(), p.y(), p.r());
    }

    private static boolean calcHit(int x, float y, int r){
        if (x >= 0 && y >= 0) return x * x + y * y <= r * r;    // 1-я четверть
        else if (x < 0 && y >= 0) return x >= -r/2 && y <= r;   // 2-я четверть
        else if (x <= 0 && y < 0) return y >= -2 * x - r;       // 3-ья четверть
        else return false;                                      // 4-я четверть
    }
}