abstract class LocalStorage {
  Future getStorageMap(String key);
  Future getStorageList(String key);
  Future getItem(String key, String chave);
  Future setStorageMap(String key, Map<String, dynamic> dados);
  Future setStorageList(String key, List dados);
  Future setItem(String key, String chave, dynamic valor);
}