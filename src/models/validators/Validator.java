package models.validators;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import models.Task;

public class Validator {
    public static List<String> validate(Task m) {
        List<String> errors = new ArrayList<String>();

        String title_error = _validateTitle(m.getTitle());
        if(!title_error.equals("")) {
            errors.add(title_error);
        }

        String content_error = _validateContent(m.getContent());
        if(!content_error.equals("")) {
            errors.add(content_error);
        }

        String deadline_at = _validateDeadline_at(m.getDeadline_at());
        if(!deadline_at.equals("")) {
            errors.add(deadline_at);
        }

        return errors;
    }

    private static String _validateTitle(String title) {
        if(title == null || title.equals("")) {
            return "タイトルを入力してください。";
        }

        return "";
    }

    private static String _validateContent(String content) {
        if(content == null || content.equals("")) {
            return "メッセージを入力してください。";
        }

        return "";
    }

    private static String _validateDeadline_at(Timestamp deadline_at) {
        if(deadline_at == null) {
            return "タスク期限を設定してください。";
        }

        LocalDate now = LocalDate.now();
        if(now.isBefore(deadline_at.toLocalDateTime().toLocalDate())){
            return "タスク期限を未来日に設定してください。";
        }

        return "";
    }
}