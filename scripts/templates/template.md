---
layout: container
name: {{ container }}
updated_at: {{ updated_at }}
{% if size %}size: {{ size }}MB{% endif %}
container_url: https://github.com/orgs/rse-radiuss/packages/container/package/{{ name }}
versions:
{% for tag, metadata in metadata.items() %} - tag: {{ tag }}
   dockerfile: https://github.com/rse-radiuss/docker-images/blob/main/{{ metadata.dockerfile }}
   manifest: {{ metadata.manifest }}
{% endfor %}
---

