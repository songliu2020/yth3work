package cn.edu.nenu.service;

import cn.edu.nenu.config.orm.jpa.DynamicSpecifications;
import cn.edu.nenu.config.orm.jpa.SearchFilter;
import cn.edu.nenu.domain.Dictionarya;
import cn.edu.nenu.repository.DictionaryRepositorya;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class DictionaryaService {


    @Autowired
    DictionaryRepositorya dictRepo;


    public Dictionarya findOne(Long pkId){
        return dictRepo.findOne(pkId);
    }

    public Dictionarya save(Dictionarya entity){
        return dictRepo.save(entity);
    }

    public Iterable<Dictionarya> sava(Iterable<Dictionarya> entities){
        return dictRepo.save(entities);
    }

    public void remove(Long pkId){
        dictRepo.delete(pkId);
    }

    public void remove(Dictionarya entity){
        dictRepo.delete(entity);
    }

    public void remove(Iterable<Dictionarya> dicts){
        dictRepo.delete(dicts);
    }

    public List<Dictionarya> findByType(String type){
        return dictRepo.findByTypeOrderBySort(type);
    }

    public Page<Dictionarya> getEntityPage(Map<String, Object> filterParams, int pageNumber, int pageSize, String sortType){
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
        Specification<Dictionarya> spec = buildSpecification(filterParams);
        return dictRepo.findAll(spec,pageRequest);
    }
    /**
     * 创建分页请求.
     */
    private PageRequest buildPageRequest(int pageNumber, int pageSize, String sortType) {
        Sort sort = null;
        if ("auto".equals(sortType)) {
            sort = new Sort(Sort.Direction.ASC, "sort");
        } else if ("sort".equals(sortType)) {
            sort = new Sort(Sort.Direction.ASC, "sort");
        }
        return new PageRequest(pageNumber - 1, pageSize, sort);
    }

    private Specification<Dictionarya> buildSpecification(Map<String, Object> filterParams) {

        Map<String, SearchFilter> filters = SearchFilter.parse(filterParams);

        Specification<Dictionarya> spec = DynamicSpecifications.bySearchFilter(filters.values(), Dictionarya.class);
        return spec;
    }

    public float getMaxSort() {
        Dictionarya dict = dictRepo.findFirstByOrderBySortDesc();
        if (dict==null){
            return 0;
        }else {
            return dict.getSort();
        }

    }
}
