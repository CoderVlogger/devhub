from django.conf import settings
from django.contrib.auth.models import User
from django.db import models


class Request(models.Model):
    time = models.DateTimeField(auto_now_add=True)
    host = models.CharField(max_length=1000)
    path = models.CharField(max_length=1000)
    method = models.CharField(max_length=50)
    uri = models.CharField(max_length=2000)
    status_code = models.IntegerField()
    user_agent = models.CharField(max_length=1000, blank=True, null=True)
    remote_addr = models.GenericIPAddressField()
    remote_addr_fwd = models.GenericIPAddressField(blank=True, null=True)
    meta = models.TextField()
    cookies = models.TextField(blank=True, null=True)
    get = models.TextField(blank=True, null=True)
    post = models.TextField(blank=True, null=True)
    raw_post = models.TextField(blank=True, null=True)
    is_secure = models.BooleanField()
    is_ajax = models.BooleanField()
    user = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        blank=True,
        null=True,
        on_delete=models.SET_NULL)

    def compare_link(self, obj):
        return '<a href="/admin/app/foo/my_custom_action/%d/" class="link">Action name</a>' % obj.id
    compare_link.short_description = 'Compare'
    compare_link.allow_tags = True
