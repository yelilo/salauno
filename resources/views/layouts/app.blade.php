<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>salauno :: Campañas</title>
    <link rel="icon" href="{{url('img/favicon.png')}}">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700">
    {!! Html::style('css/bootstrap.min.css') !!}
    <style>
        body {
            font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
        }
        .fa-btn {
            margin-right: 6px;
        }
        #agenda{
            width: 100%;
            height:450px;
            border:0;
        }
    </style>
    {!! HTML::script('js/npm.js') !!}
    {!! HTML::script('js/jquery.min.js') !!}
    {!! Html::script('js/bootstrap.min.js') !!}
    {!! Html::script('js/jquery-2.2.3.min.js') !!}
</head>
<body id="app-layout">
    <div id="wrap">
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
                        <img alt="salauno" src="{{url('img/logotipo_salauno_mediano.png')}}" width="90px">
                    </a>
                </div>

                <div class="collapse navbar-collapse" id="app-navbar-collapse">
                    <!-- Left Side Of Navbar -->
                        <ul class="nav navbar-nav">
                    @if (Auth::guest())
                        <li><a href="{{ url('/home') }}">Inicio</a></li>
                    @else
                        <li><a href="{{ url('/candidate/create') }}">1. Registro</a></li>
                        <li><a href="{{ url('/candidate') }}">2. Tamizaje</a></li>
                        <li><a href="{{ url('/exploration') }}">3. Exploración</a></li>
                        <li><a href="{{ url('/refraction') }}">4. Optica</a></li>
                        <li><a href="{{ url('/consejeria') }}">5. Consejeria</a></li>
                        @if (Auth::user()->id <= 3 )
                            <li><a href="{{ url('/campaign') }}">Campañas</a></li>
                            <li><a href="{{ url('/seguimiento') }}">Seguimiento</a></li>
                            {{-- <li><a href="{{ url('/configuracion') }}">Configuracion</a></li> --}}
                            {{-- <li><a href="{{ url('/configuracion') }}">Configuracion</a></li> --}}
                        @endif
                    @endif
                        </ul>

                    <!-- Right Side Of Navbar -->
                    <ul class="nav navbar-nav navbar-right">
                        <!-- Authentication Links -->
                        @if (Auth::guest())
                            <li><a href="{{ url('/login') }}">Login</a></li>
                            {{-- <li><a href="{{ url('/register') }}">Register</a></li> --}}
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
        <div class="container">
            <div class="row">
                {{-- <div class="col-md-10 col-md-offset-1"> --}}
                    {{-- <div class="container-fluid"> --}}
                        @if(count($errors) > 0)
                            <div class="alert alert-danger" role="alert">
                                <ul>
                                    @foreach($errors->all() as $error)
                                        <li>
                                            {{$error}}
                                        </li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif

                        @if(Session::has('message'))
                            <div class="alert alert-info" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                {{Session::get('message')}}
                            </div>
                        @endif

                        @if(Session::has('message-info'))
                            <div class="alert alert-success" role="alert">
                              <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                              {{Session::get('message-info')}}
                            </div>
                        @endif
                        @yield('content')
                    {{-- </div> --}}
                {{-- </div> --}}
            </div>
        </div>
    </div>
    {{-- <footer class="footer">
        <nav class="navbar navbar-default navbar-fixed-bottom">
          <div class="container">
            <div class="row">
                <div class="col-xs-2">
                    sala<b>uno</b>
                </div>
                <div class="col-xs-10">
                    <ul class="list-inline text-right">
                        <li><a href="#">Buenavista</a></li>
                        <li><a href="#">Coyoacán</a></li>
                        <li><a href="#">Cuautitlán</a></li>
                        <li><a href="#">Gran Sur</a></li>
                        <li><a href="#">Satélite</a></li>
                        <li><a href="#">Narvarte</a></li>
                        <li><a href="#">Roma Norte</a></li>
                        <li><a href="#">Tezontle</a></li>
                    </ul>
                </div>
            </div>
          </div>
        </nav>
    </footer> --}}
    <!-- Modal -->
        <div id="myModal" class="modal fade" role="dialog">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
            </div>
          </div>
        </div>

        <div id="candidates" class="modal fade" role="dialog">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
            </div>
          </div>
        </div>
        <div id="reviews" class="modal fade" role="dialog">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
            </div>
          </div>
        </div>
        <div id="explorations" class="modal fade" role="dialog">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
            </div>
          </div>
        </div>
        <div id="resultados" class="modal fade" role="dialog">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
            </div>
          </div>
        </div>
        <div id="refractions" class="modal fade" role="dialog">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
            </div>
          </div>
        </div>
    {{-- modal enfermedades --}}
        <div id="moda_retinopatia_diabetica" class="modal fade" role="dialog">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
            </div>
          </div>
        </div>
        <div id="moda_maculopatia" class="modal fade" role="dialog">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
            </div>
          </div>
        </div>
        <div id="moda_retinopatia_hipertensiva" class="modal fade" role="dialog">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
            </div>
          </div>
        </div>
        <div id="moda_catarata_incipiente" class="modal fade" role="dialog">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
            </div>
          </div>
        </div>
        <div id="moda_pterigion" class="modal fade" role="dialog">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
            </div>
          </div>
        </div>
        <div id="moda_catarata_avanzada" class="modal fade" role="dialog">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
            </div>
          </div>
        </div>
        <div id="moda_glaucoma" class="modal fade" role="dialog">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
            </div>
          </div>
        </div>
        <div id="moda_oculoplastica" class="modal fade" role="dialog">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
            </div>
          </div>
        </div>
        <div id="moda_conjuntivitis" class="modal fade" role="dialog">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
            </div>
          </div>
        </div>
        <div id="moda_iridopatia" class="modal fade" role="dialog">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
            </div>
          </div>
        </div>
        <div id="moda_revision_integral" class="modal fade" role="dialog">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
            </div>
          </div>
        </div>
    {{-- modal enfermedades --}}
</body>
</html>
