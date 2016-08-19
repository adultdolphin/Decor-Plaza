<?php
class ControllerModuleText extends Controller {
    public function index($setting) {

        $this->load->language('module/text'); //подключаем любой языковой файл
        $data['heading_title'] = $this->language->get('heading_title'); //объявляем переменную heading_title с данными из языкового файла

       // $data['content']="Ваш контент";        //можно задать данные, сразу в контроллере

        $this->load->model('design/text'); //подключаем любую модель из OpenCart

        $result = $this->model_design_text>getText($setting['text_id']); //используем метод подключенной модели, например getProduct(42) – информация о продукте id  42

        $data['text'][] = array(
            'title' => $result['title'],
            'second_title' => $result['second_title'],
            'text' => $result['text']
        );

        /*
         * $results = $this->model_design_banner->getBanner($setting['banner_id']);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['banners'][] = array(
					'title' => $result['title'],
					'second_title' => $result['second_title'],
					'third_title' => $result['third_title'],
					'link'  => $result['link'],
					//'image' => $result['image'],
					'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
				);
			}
		}
         */
        //стандартная процедура для контроллеров OpenCart, выбираем файл представления модуля для вывода данных
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/text.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/module/text.tpl', $data);
        } else {
            return $this->load->view('default/template/module/text.tpl', $data);
        }

    }
}?>