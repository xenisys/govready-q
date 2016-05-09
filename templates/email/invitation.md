{% extends "email/template" %}
{% block content %}
Hello,

{% if invitation.into_discussion %}
{{invitation.from_user}} is inviting you to join the discussion {{invitation.into_discussion.title}} at GovReady Q.
{% elif invitation.into_task_editorship %}
{{invitation.from_user}} is inviting you to take over editing {{invitation.into_task_editorship.title}} at GovReady Q.
{% elif invitation.into_new_task_module_id %}
{{invitation.from_user}} is inviting you to complete the module {{invitation.into_new_task_module_title}} at GovReady Q.
{% else %}
{{invitation.from_user}} is inviting you to collaborate on {{invitation.from_project.title}} at GovReady Q.
{% endif %}

> {{invitation.text}}

To accept the invitation and help {{invitation.from_user}}, please follow the following link:

[{{invitation.get_acceptance_url}}]({{invitation.get_acceptance_url}})

{{invitation.from_user}} will appreciate it!

Thank you,
{% endblock %}