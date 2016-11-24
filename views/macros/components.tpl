{% macro badge(content, badge, overlap=False, icon=False) %}
  {% set class = ['mdl-badge'] %}
  {% if icon %}
    {% do class.append('material-icons') %}
  {% endif %}
  {% if overlap %}
    {% do class.append('mdl-badge--overlap') %}
  {% endif %}
  {% if icon %}
  <div
    class="{{ class|join(' ') }}"
    data-badge="{{ badge|safe }}"
  >
  {{ content|safe }}
  </div>
  {% else %}
    <span
      class="{{ class|join(' ') }}"
      data-badge="{{ _(badge)|safe }}"
    >
      {{ _(content)|safe }}
    </span>
  {% endif %}
{% endmacro %}

{% macro button(button_options) %}
  {% set class = ['mdl-button', 'mdl-js-button'] %}
  {% if button_options.fab %}
    {% do class.append('mdl-button--fab') %}
  {% endif %}
  {% if button_options.mini_fab %}
    {% do class.append('mdl-button--mini-fab') %}
  {% endif %}
  {% if button_options.raised %}
    {% do class.append('mdl-button--raised') %}
  {% endif %}
  {% if button_options.accent %}
    {% do class.append('mdl-button--accent') %}
  {% endif %}
  {% if button_options.colored %}
    {% do class.append('mdl-button--colored') %}
  {% endif %}
  {% if button_options.ripple %}
    {% do class.append('mdl-js-ripple-effect') %}
  {% endif %}
  {% if button_options.icon %}
    {% do class.append('mdl-button--icon') %}
  {% endif %}
  <button
    class="{{ class | join(' ') }}"
    {%- if disabled %} disabled {%- endif -%}
  >
    {% if button_options.icon %}
    <i class="material-icons">
      {{ _(button_options.content) | safe }}
    </i>
    {% else %}
      {{ _(button_options.content) | safe }}
    {% endif %}
  </button>
{% endmacro %}

{% macro card(card_options) %}
  <div class="mdl-card mdl-shadow--{{card_options.depth}}dp {{card_options.card_class}}">
    {% if card_options.title %}
      <div class="mdl-card__title">
        <h{{card_options.title_size}} class="mdl-card__title-text">
          {{ _(card_options.title) }}
        </h{{card_options.title_size}}>
      </div>
    {% endif %}

    {% if card_options.supporting_text -%}
      <div class="mdl-card__supporting-text">
        {{ _(card_options.supporting_text) }}
      </div>
    {%- endif %}

    {% if card_options.actions %}
      {% if card_options.actions_bordered %}
      <div class="mdl-card__actions mdl-card--border">
      {% else %}
      <div class="mdl-card__actions">
      {% endif %}
        {% for action in card_options.actions %}
          {{ button(action) }}
        {% endfor %}
      </div>
    {% endif %}

    {% for menu_item in  card_options.menu %}
      <div class="mdl-card__menu">
        {{ button(menu_item) }}
      </div>
    {% endfor %}
  </div>
{% endmacro %}

{% macro chip(chip_options) %}
  {% if chip_options.deletable %}
    <span class="mdl-chip mdl-chip--deleable">
      <span class="mdl-chip__text">
        {{ _(chip_options.content) }}
      </span>
      <button type="button" class="mdl-chip__action">
        <i class="material-icons">
          {{ chip_options.action_icon }}
        </i>
      </button>
    </span>
  {% elif chip_options.button %}
		<button type="button" class="mdl-chip">
			<span class="mdl-chip__text">
				{{ _(chip_options.content) }}
			</span>
		</button>
  {% elif chip_options.contact %}
    <span class="mdl-chip mdl-chip--contact">
      <span
      class="mdl-chip__contact mdl-color--{{chip_options.contact_background}}
      mdl-color-text--{{chip_options.contact_foreground}}">
        {{ _(chip_options.contact_content) }}
      </span>
			<span class="mdl-chip__text">
				{{ _(chip_options.content) }}
			</span>
    </span>
  {% else %}
    <span class="mdl-chip">
      <span class="mdl-chip__text">
        {{ _(chip_options.content) }}
      </span>
    </span>
  {% endif %}
{% endmacro %}
