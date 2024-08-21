<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\RegisterRequest;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class AuthController extends Controller
{
    public function register( RegisterRequest $request )
    {
        $model         = joyProviderModel();
        $validatedData = $request->validated();

        if ($request->has('social_login')) {
            $validatedData[ 'password' ] = bcrypt(Str::random());
            $user = (new $model())->where('email', $validatedData['email'])->first();
        } else {
            $validatedData[ 'password' ] = bcrypt($request->password);
            $user = (new $model())->create($validatedData);
        }

        event(new Registered($user));

        $accessToken = $user->createToken('authToken')->accessToken;

        return response(['user' => $user, 'access_token' => $accessToken]);
    }
}
