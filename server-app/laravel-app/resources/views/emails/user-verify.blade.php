<!DOCTYPE html>
<html lang="en-US">

<head>
    <meta charset="utf-8">
</head>

<body>
    <p>
        Dear {{$user->name}},</p>
    <p>
        Please click the button below to confirm your email address.
    </p>


    <a href="{{ $actionUrl }}" class="button">{{$actionText}}</a>

    <p>If you didn't create an account, no further action is required.</p>

    <p>
        Best regards,<br>

        {{ config('app.name')}}
    </p>

    <p>
        <hr>
        <span class="break-all">
            <strong>If you cannot click the link, please copy and paste the following URL into your web browser: </strong><br />
            <em>{{$actionUrl}}</em>
        </span>
    </p>

</body>

</html>
