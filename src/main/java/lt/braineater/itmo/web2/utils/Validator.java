package lt.braineater.itmo.web2.utils;

import java.util.List;
import java.util.Optional;

public class Validator {
    private static final List<Integer> CORRECT_X = List.of(-3, -2, -1, 0, 1, 2, 3, 4, 5);
    private static final List<Integer> CORRECT_R = List.of(1, 2, 3, 4, 5);

    public static Optional<Point> validateParams(String strX, String strY, String strR) {
        try {
            int x = Integer.parseInt(strX);
            float y = Float.parseFloat(strY);
            int r = Integer.parseInt(strR);

            if (CORRECT_X.contains(x) && CORRECT_R.contains(r) && -5 <= y && y<= 3)
                return Optional.of(new Point(x, y, r));
            else return Optional.empty();

        } catch (NumberFormatException e) {return Optional.empty();}
    }
}
