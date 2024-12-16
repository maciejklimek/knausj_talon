app: chrome
title: /.*login\.microsoftonline\.com.*/
-
(login|log) p g:
    user.rango_run_action_on_text_matched_element("clickElement", "klimek.mk@pg.com", true)
(login|log) lingaro|lean|work:
    user.rango_run_action_on_text_matched_element("clickElement", "maciej.klimek@lingarogroup.com", true)
(login|log) maciek|personal:
    user.rango_run_action_on_text_matched_element("clickElement", "maciej.klimek@gmail.com", true)
