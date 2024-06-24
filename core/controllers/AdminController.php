<?php

namespace core\controllers;

use core\classes\Database;
use core\models\User;
use core\classes\Functions;
use core\classes\SendEmail;
use core\models\Admin;
use core\models\Product;

class AdminController
{
    public function product_questions_page($segment = null)
    {



        //Checks if user is admin
        if ($_SESSION['user_id']  != 1) {
            Functions::redirect('home');
            return;
        }


        $data = null;
        $admin = new Admin();
        $product = new Product();


        if ($segment === NULL) {

            $data = $admin->list_active_product_questions();
        } else if ($segment === 'nao-respondidas') {

            $data = $admin->list_active_product_questions();

        } else if ($segment === 'respondidas') {

            $data = $admin->list_answered_product_questions();

            // print_r($data);
            // die('opa');
        } else if ('deletadas') {

            $data = $admin->list_deleted_product_questions();
        }

        // print_r($data);
        // die('aqui');

        //Header data
        $header_data = [
            'products_count' => $product->get_products_count(),
            'products_questions_count' => $product->get_products_messages_count(),
            'user_messages_count' => $admin->get_user_messages_count()
        ];


        Functions::Layout([
            'layouts/html_header',
            'layouts/header',
            'perguntas-em-produtos',
            'layouts/footer',
            'layouts/html_footer',
        ], $data, $header_data);
    }
    //===============================================================


    public function answer_question()
    {

        //Check if variables come correctly
        $_POST['answer'];
        $_POST['product_id'];
        $_POST['user_id'];


        $admin = new Admin();

        $results = $admin->answer_question();



        if (!$results) {

            $_SESSION['error'] = 'Erro ao responder pergunta';
            Functions::redirect('perguntas-em-produtos');
            return;
        }


        $_SESSION['success'] = 'Pergunta respondida com sucesso';
        Functions::redirect('perguntas-em-produtos');
        return;
    }
    //===============================================================

    public function list_user_messages_page()
    {
        //Checks if user is admin
        if ($_SESSION['user_id']  != 1) {
            Functions::redirect('home');
            return;
        }
        $admin = new Admin();
        $product = new Product();

        $data = $admin->list_active_user_messasges();

        // print_r($data);

        //Header data
        $header_data = [
            'products_count' => $product->get_products_count(),
            'products_questions_count' => $product->get_products_messages_count(),
            'user_messages_count' => $admin->get_user_messages_count()
        ];

        Functions::Layout([
            'layouts/html_header',
            'layouts/header',
            'mensagens-de-usuarios',
            'layouts/footer',
            'layouts/html_footer',
        ], $data, $header_data);
    }
    //===============================================================

    public function answer_user_message_page()
    {

        //Checks if user is admin
        if ($_SESSION['user_id']  != 1) {
            Functions::redirect('home');
            return;
        }
        $admin = new Admin();
        $product = new Product();

        $data = $admin->get_user_message_information();

        // print_r($data);
        //Header data
        $header_data = [
            'products_count' => $product->get_products_count(),
            'products_questions_count' => $product->get_products_messages_count(),
            'user_messages_count' => $admin->get_user_messages_count()
        ];

        Functions::Layout([
            'layouts/html_header',
            'layouts/header',
            'responder-mensagem-de-usuario',
            'layouts/footer',
            'layouts/html_footer',
        ], $data, $header_data);
    }
    //===============================================================


    public function answer_user_message($chat_message_id)
    {

        $user_id = $_GET['user_id'];
        $product_id = $_GET['product-id'];

        //Check if inputs are coming filled
        if (!isset($_POST['answer']) || empty(trim($_POST['answer']))) {
            $_SESSION['error'] = 'É necessário escrever uma resposta';
            Functions::redirect('responder-mensagem-de-usuario&user_id=' . $user_id . '&product-id=' . $product_id);
            return;
        }
        if (!isset($_POST['chat-message-id'])) {
            $_SESSION['error'] = 'Erro';
            Functions::redirect('responder-mensagem-de-usuario&user_id=' . $user_id . '&product-id=' . $product_id);
            return;
        }
        if (!isset($_POST['product-id'])) {
            $_SESSION['error'] = 'Erro';
            Functions::redirect('responder-mensagem-de-usuario&user_id=' . $user_id . '&product-id=' . $product_id);
            return;
        }
        if (!isset($_POST['user-id'])) {
            $_SESSION['error'] = 'Erro';
            Functions::redirect('responder-mensagem-de-usuario&user_id=' . $user_id . '&product-id=' . $product_id);
            return;
        }


        $admin = new Admin();
        $result = $admin->answer_user_message();

        // print_r($params);
        // die();

        if (!$result) {
            $_SESSION['error'] = 'Erro ao responder mensagem de usuário';
            Functions::redirect('responder-mensagem-de-usuario&user_id=' . $user_id . '&product-id=' . $product_id);
            return;
        }

        $_SESSION['success'] = 'Mensagem respondida com sucesso';
        Functions::redirect('mensagens-de-usuarios');
        return;
    }
    //===============================================================

}
