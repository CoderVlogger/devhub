from django.shortcuts import render
from django.contrib.auth import authenticate, logout
from django.contrib.auth import login as auth_login
from django.http import HttpResponseRedirect, HttpResponse


def index(request):
   return render(request, "account/index.html")


def login(request):
   if request.method == 'POST':
      username = request.POST.get('username')
      password = request.POST.get('psw')
      user = authenticate(username=username, password=password)
      if user:
         if user.is_active:
            auth_login(request,user)
            return HttpResponse ("your account is ok")
         else: 
            return HttpResponse ("Your account was inactive")   
      else: 
         print("Someone tried to log in and Failed")
         return HttpResponse ("Invalid credentials")
   else:
      return render(request, "account/login/login.html")

