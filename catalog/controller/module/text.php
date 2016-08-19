<?php
class ControllerModuleText extends Controller {
    public function index($setting) {
    //var_dump($setting); die();
        $this->load->language('module/text'); //подключаем любой языковой файл
        $data['heading_title'] = $this->language->get('heading_title'); //объявляем переменную heading_title с данными из языкового файла

        $this->load->model('design/text'); //подключаем любую модель из OpenCart

        //$result = $this->model_design_text>getText($setting['text_id']); //используем метод подключенной модели, например getProduct(42) – информация о продукте id  42

        $data['title'] = $setting['title'];
        $data['second_title'] = $setting['second_title'];
        $data['text'] = $setting['text'];


        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/text.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/module/text.tpl', $data);
        } else {
            return $this->load->view('default/template/module/text.tpl', $data);
        }

    }
}?>