<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Salauno Campañas</title>

    <!-- Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700">

    <!-- Styles -->
    {!! Html::style('css/bootstrap.min.css') !!}
    <style>
        body {
            font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
        }
        .fa-btn {
            margin-right: 6px;
        }
    </style>
</head>
<body id="app-layout">
    <nav class="navbar navbar-default navbar-static-top">
        <div class="container">
            <div class="navbar-header">

                <!-- Collapsed Hamburger -->
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#app-navbar-collapse">
                    <span class="sr-only">Toggle Navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <!-- Branding Image -->
                <a class="navbar-brand" href="{{ url('/') }}">
                    <img alt="SalaUno" src="img/logotipo_salauno_mediano.png" width="90px">
                </a>
            </div>

            <div class="collapse navbar-collapse" id="app-navbar-collapse">
                <!-- Left Side Of Navbar -->
                    <ul class="nav navbar-nav">
                @if (Auth::guest())
                    <li><a href="{{ url('/home') }}">Inicio</a></li>
                @else
                    <li><a href="{{ url('/candidate/create') }}">Registro</a></li>
                    <li><a href="{{ url('/candidate') }}">Revisiones</a></li>
                    <li><a href="{{ url('/exploration') }}">Exploraciones</a></li>
                    <li><a href="{{ url('/display') }}">Optica</a></li>
                    <li><a href="{{ url('/enfermeria') }}">Enfermeria</a></li>
                    <li><a href="{{ url('/consejeria') }}">Consejeria</a></li>
                    <li><a href="{{ url('http://salauno.force.com/voiceReminder/forcebrain__LeadRegistration?ProcessId=a1n36000000ed9ZAAQ') }}" target="_black">Generar Cita</a></li>
                    <!--@if (Auth::user()->id == 1)-->
                        <li><a href="{{ url('/campaign') }}">Campañas</a></li>
                        <li><a href="{{ url('/seguimiento') }}">Seguimiento</a></li>
                        <li><a href="{{ url('/seguimiento') }}">Configuracion</a></li>
                    <!--@endif-->
                @endif
                    </ul>

                <!-- Right Side Of Navbar -->
                <ul class="nav navbar-nav navbar-right">
                    <!-- Authentication Links -->
                    @if (Auth::guest())
                        <li><a href="{{ url('/login') }}">Login</a></li>
                        <!--<li><a href="{{ url('/register') }}">Register</a></li>-->
                    @else
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                                {{ Auth::user()->name }} <span class="caret"></span>
                            </a>

                            <ul class="dropdown-menu" role="menu">
                                <li><a href="{{ url('/logout') }}"><i class="fa fa-btn fa-sign-out"></i>Logout</a></li>
                            </ul>
                        </li>
                    @endif
                </ul>
            </div>
        </div>
    </nav>

    @yield('content')
    {!! HTML::script('js/npm.js') !!}
    {!! HTML::script('js/jquery.min.js') !!}
    {!! Html::script('js/bootstrap.min.js') !!}
</body>
</html>
