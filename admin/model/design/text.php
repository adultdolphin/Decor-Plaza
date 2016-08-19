<?php
class ModelDesignText extends Model {

    public function addText($data) {
        $this->event->trigger('pre.admin.text.add', $data);

        $this->db->query("INSERT INTO " . DB_PREFIX . "text SET name = '" . $this->db->escape($data['name']) . "', status = '" . (int)$data['status'] . "'");

        $text_id = $this->db->getLastId();
        foreach ($data['text'] as $text) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "text SET text_id = '" . (int)$text_id . "', title = '" . $text['title'] . "', second_title = '" . $text['second_title'] . "', text = '" . $text['text'] . "'");
        }

        $this->event->trigger('post.admin.text.add', $text_id);

        return $text_id;
    }

    /*public function editBanner($banner_id, $data) {
        $this->event->trigger('pre.admin.banner.edit', $data);

        $this->db->query("UPDATE " . DB_PREFIX . "banner SET name = '" . $this->db->escape($data['name']) . "', status = '" . (int)$data['status'] . "' WHERE banner_id = '" . (int)$banner_id . "'");

        $this->db->query("DELETE FROM " . DB_PREFIX . "banner_image WHERE banner_id = '" . (int)$banner_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "banner_image_description WHERE banner_id = '" . (int)$banner_id . "'");

        if (isset($data['banner_image'])) {
            foreach ($data['banner_image'] as $banner_image) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "banner_image SET banner_id = '" . (int)$banner_id . "', link = '" .  $this->db->escape($banner_image['link']) . "', image = '" .  $this->db->escape($banner_image['image']) . "', sort_order = '" . (int)$banner_image['sort_order'] . "'");

                $banner_image_id = $this->db->getLastId();

                foreach ($banner_image['banner_image_description'] as $language_id => $banner_image_description) {
                    $this->db->query("INSERT INTO " . DB_PREFIX . "banner_image_description SET banner_image_id = '" . (int)$banner_image_id . "', language_id = '" . (int)$language_id . "', banner_id = '" . (int)$banner_id . "', title = '" .  $this->db->escape($banner_image_description['title']) . "', second_title = '" .  $this->db->escape($banner_image_description['second_title']) . "', third_title = '" .  $this->db->escape($banner_image_description['third_title']) . "'");
                }
            }
        }

        $this->event->trigger('post.admin.banner.edit', $banner_id);
    }

    public function deleteBanner($banner_id) {
        $this->event->trigger('pre.admin.banner.delete', $banner_id);

        $this->db->query("DELETE FROM " . DB_PREFIX . "banner WHERE banner_id = '" . (int)$banner_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "banner_image WHERE banner_id = '" . (int)$banner_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "banner_image_description WHERE banner_id = '" . (int)$banner_id . "'");

        $this->event->trigger('post.admin.banner.delete', $banner_id);
    } */

    public function getText($text_id) {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "text WHERE text_id = '" . (int)$text_id . "'");

        return $query->row;
    }

    public function getTexts($data = array()) {
        $sql = "SELECT * FROM " . DB_PREFIX . "text";

        $sort_data = array(
            'title',
            'status'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY title";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }

        $query = $this->db->query($sql);

        return $query->rows;
    }

}