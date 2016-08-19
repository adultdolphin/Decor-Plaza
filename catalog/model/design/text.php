<?php
class ModelDesignText extends Model {

    public function getText($text_id) {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "text WHERE text_id = '" . (int)$text_id . "'");

        return $query->row;
    }

}