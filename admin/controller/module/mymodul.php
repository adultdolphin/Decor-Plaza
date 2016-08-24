<?php
class ControllerModulemymodul extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/mymodul'); //���������� ��� �������� ����

		$this->load->model('setting/setting');   //���������� ������ setting, �� ��������� ��������� ��������� ������ � ��

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) { //���� �� ������ "���������"  � ������, �� ��������� ������� ���������
			$this->model_setting_setting->editSetting('mymodul', $this->request->post);
			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

         // ���� ����������
		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');		

		$data['entry_status'] = $this->language->get('entry_status');

        // ���� ����� validate ������ warning, ��������� ��� �������������
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

        // ����� ���� ������������ ������� breadcrumbs (������� ������)
		$data['breadcrumbs'] = array();
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/category', 'token=' . $this->session->data['token'], 'SSL')
		);

        //������ ��� ����� � ������ "cancel"
		$data['action'] = $this->url->link('module/mymodul', 'token=' . $this->session->data['token'], 'SSL');
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		//���������� � �������� ������
        if (isset($this->request->post['mymodul_status'])) {
			$data['mymodul_status'] = $this->request->post['mymodul_status'];
		} else {
			$data['mymodul_status'] = $this->config->get('mymodul_status');
		}

        //������ �� ����������� header,column_left,footer, ����� �� �� ������ ������� ���������, ������ � ����� ���� � ����� �������������
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

        //� �������� ����� ������������� ������ ��� ������ �������������� ������������ ���� mymodul.tpl
		$this->response->setOutput($this->load->view('module/mymodul.tpl', $data));
	}

    //������������ ����� � �����������, �� ����������� ��� �������� ��������� �� ������������ �������� ��������� ������� ������
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/category')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		return !$this->error;
	}
}