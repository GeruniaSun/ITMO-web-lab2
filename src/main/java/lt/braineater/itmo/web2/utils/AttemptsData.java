package lt.braineater.itmo.web2.utils;

import java.util.ArrayList;
import java.util.List;

public class AttemptsData {
    private final List<Attempt> attempts = new ArrayList<>();

    public void addAttempt(Attempt att) {
        attempts.add(att);
    }

    public List<Attempt> getAttempts() {
        return attempts;
    }
}
