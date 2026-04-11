{% set seasons = ["Winter","Spring","Summer","Fall"] %}

{% for i in seasons %}

    {% if i != "Summer" %}

        {{ i }}

    {% else %}

        I hate {{ i }}

    {% endif %}
    
{% endfor %}