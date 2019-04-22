from django.shortcuts import render


def index(request):
   return render(request, "account/index.html")


def login(request):
    return render(request, "account/login/login.html")
