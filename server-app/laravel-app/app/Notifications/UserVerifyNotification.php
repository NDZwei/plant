<?php

namespace App\Notifications;

use Illuminate\Auth\Notifications\VerifyEmail;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Support\Facades\Auth;

class UserVerifyNotification extends VerifyEmail implements ShouldQueue
{
    use Queueable;
    public $user;

    public function __construct($user = '')
    {
        $this->user = $user ?: Auth::user();
    }

    public function via($notifiable)
    {
        return ['mail'];
    }

    public function toMail($notifiable)
    {
        $actionUrl = $this->verificationUrl($notifiable);
        $actionText = 'Click here to confirm your account';
        return (new MailMessage)->subject('[Plant-app] Email confirm for sign-up verification')->view(
            'emails.user-verify',
            [
                'user' => $this->user,
                'actionText' => $actionText,
                'actionUrl' => $actionUrl,
            ]
        );
    }
}
