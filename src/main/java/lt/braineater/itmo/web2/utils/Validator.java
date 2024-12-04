package lt.braineater.itmo.web2.utils;

import java.util.List;
import java.util.Optional;

public class Validator {
    private static final List<Integer> CORRECT_R = List.of(1, 2, 3, 4, 5);

    public static Optional<Point> validateParams(String strX, String strY, String strR) {
        try {
            float x = Float.parseFloat(strX);
            float y = Float.parseFloat(strY);
            int r = Integer.parseInt(strR);

            if (-5 <= x && x <= 5 && CORRECT_R.contains(r) && -5 <= y && y<= 5)
                return Optional.of(new Point(x, y, r));
            else return Optional.empty();

        } catch (NumberFormatException e) {return Optional.empty();}
    }
}
