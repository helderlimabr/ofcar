@php
    require_once __DIR__.'/../helpers.php';
@endphp
@extends('template')
@section('content')
    <div class="row">
        <div class="col-md-12 col-sm-12 ">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Perfis de Usuário</h2>
                    <ul class="nav navbar-right panel_toolbox">
                        <li>
                            <a href="@php echo url('profile/form') @endphp" class="btn btn-new">Novo Perfil</a>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card-box table-responsive">
                                <table id="datatable-buttons" class="table table-striped table-bordered"
                                       style="width:100%">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Descrição</th>
                                        <th class="columns-actions" data-orderable="false">-</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($profiles as $profile)
                                        <tr>
                                            <td>{{ $profile['id'] }}</td>
                                            <td>{{ $profile['description'] }}</td>
                                            <td>
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown"
                                                            aria-haspopup="true" aria-expanded="false">
                                                        Ações
                                                    </button>
                                                    <div class="dropdown-menu">
                                                        <a class="dropdown-item" href="@php echo url('profile/'.$profile['id']); @endphp"><i class="fa fa-eye"></i> Visualizar</a>
                                                        <a class="dropdown-item" href="@php echo url('profile/update/'.$profile['id']); @endphp"><i class="fa fa-edit"></i> Atualizar</a>
                                                        <a class="dropdown-item" href="#"><i class="fa fa-trash"></i> Deletar</a>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>


    </script>
@endsection
