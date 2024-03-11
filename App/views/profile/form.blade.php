@php
    require_once __DIR__.'/../helpers.php';
@endphp
@extends('template')
@section('content')
    <div class="">
        <div class="row">
            <div class="col-md-12 col-sm-12 ">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Formulário Perfis</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <br/>
                        @if(!empty($update))
                            <form action="@php echo url('profile/update'); @endphp" method="post" data-parsley-validate
                                  class="form-horizontal form-label-left">
                        @else
                            <form action="@php echo url('profile'); @endphp" method="post" data-parsley-validate
                                  class="form-horizontal form-label-left">
                        @endif
                            @if(!empty($update))
                                <input type="hidden" name="update">
                                <input type="hidden" name="id" value="{{$profile->id}}">
                            @endif
                            <div class="item form-group">
                                <label class="col-form-label col-md-3 col-sm-3 label-align" for="first-name">
                                    Descrição <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 ">
                                    @if(!empty($update))
                                        <input type="text" id="name" name="description" required="required"
                                               class="form-control " value="{{$profile->description}}">
                                    @else
                                        <input type="text" id="name" name="description" required="required"
                                               class="form-control " {{ !empty($view) ? 'disabled' : ''}} value="{{ !empty($profile) ? $profile->description : ''}}">
                                    @endif
                                </div>
                            </div>
                            @if(!empty($update))
                                <div class="ln_solid"></div>
                                <div class="row">
                                    <div class="col-md-6 col-sm-6 offset-md-3">
                                        <div class="x_title">
                                            <h2>Permissões</h2>
                                            <div class="clearfix"></div>
                                        </div>
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th>Entidade</th>
                                                <th>Listar</th>
                                                <th>Criar</th>
                                                <th>Visualizar</th>
                                                <th>Atualizar</th>
                                                <th>Deletar</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <th scope="row">Usuarios</th>
                                                <td><input class="checkbox-permition" data-model-target="user"
                                                           value="list"
                                                           type="checkbox"/></td>
                                                <td><input class="checkbox-permition" data-model-target="user"
                                                           value="read"
                                                           type="checkbox"/></td>
                                                <td><input class="checkbox-permition" data-model-target="user"
                                                           value="create"
                                                           type="checkbox"/></td>
                                                <td><input class="checkbox-permition" data-model-target="user"
                                                           value="update"
                                                           type="checkbox"/></td>
                                                <td><input class="checkbox-permition" data-model-target="user"
                                                           value="delete"
                                                           type="checkbox"/></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Produtos e Serviços</th>
                                                <td><input class="checkbox-permition" data-model-target="product"
                                                           value="list"
                                                           type="checkbox"/></td>
                                                <td><input class="checkbox-permition" data-model-target="product"
                                                           value="read"
                                                           type="checkbox"/></td>
                                                <td><input class="checkbox-permition" data-model-target="product"
                                                           value="create"
                                                           type="checkbox"/></td>
                                                <td><input class="checkbox-permition" data-model-target="product"
                                                           value="update"
                                                           type="checkbox"/></td>
                                                <td><input class="checkbox-permition" data-model-target="product"
                                                           value="delete"
                                                           type="checkbox"/></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Profile</th>
                                                <td><input class="checkbox-permition" data-model-target="profile"
                                                           value="list"
                                                           type="checkbox"/></td>
                                                <td><input class="checkbox-permition" data-model-target="profile"
                                                           value="read"
                                                           type="checkbox"/></td>
                                                <td><input class="checkbox-permition" data-model-target="profile"
                                                           value="create"
                                                           type="checkbox"/></td>
                                                <td><input class="checkbox-permition" data-model-target="profile"
                                                           value="update"
                                                           type="checkbox"/></td>
                                                <td><input class="checkbox-permition" data-model-target="profile"
                                                           value="delete"
                                                           type="checkbox"/></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            @endif
                            <div class="ln_solid"></div>
                            <div class="item form-group">
                                <div class="col-md-6 col-sm-6 offset-md-3">
                                    <button class="btn btn-danger" type="button">Cancelar</button>
                                    <button class="btn btn-primary" type="reset">Reset</button>
                                    <button type="submit" class="btn btn-success">Salvar</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script defer>
        $(document).ready(function () {
            $('.checkbox-permition').change(function () {
                let permission = $(this).val();
                let isChecked = $(this).prop('checked');
                let model = $(this).data('model-target');
                $.ajax({
                    url: "@php echo url('permission/update'); @endphp",
                    method: 'POST',
                    data: {
                        model: model,
                        permission: permission,
                        isChecked: isChecked
                    },
                    success: function (response) {
                        console.log('Aqui');
                    },
                    error: function (error) {
                        console.error("Erro na chamada AJAX:", error);
                    }
                });
            });
        });
    </script>
@endsection