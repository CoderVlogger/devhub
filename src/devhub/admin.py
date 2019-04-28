from django.contrib import admin

from devhub import models as devhub_model


admin.site.register(devhub_model.Request)
